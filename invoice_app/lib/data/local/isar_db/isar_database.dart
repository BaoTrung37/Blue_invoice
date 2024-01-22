import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/local/isar_db/isar_database_repository.dart';
import 'package:invoice_app/data/model/invoice.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class IsarDatabase implements IsarDatabaseRepository {
  late Isar isar;
  @override
  Future<void> initIsarDataBase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        InvoiceSchema,
      ],
      directory: dir.path,
    );
  }

  @override
  Future<void> importJson() async {
    await clearDatabase();

    final jsonString = await rootBundle.loadString('assets/json/data.json');
    final jsonData = json.decode(jsonString).cast<Map<String, dynamic>>();

    await isar.writeTxn(() async {
      for (final itemData in jsonData) {
        final invoiceCollection = Invoice.fromJson(itemData);

        await isar.invoices.put(invoiceCollection);
      }
    });
  }

  @override
  Future<bool> clearDatabase() async {
    return await isar.writeTxn(() async {
      await isar.clear();
      return true;
    });
  }

  @override
  Future<List<Invoice>> getInvoices() async {
    final invoices = await isar.invoices.where().findAll();
    return invoices;
  }

  @override
  Future<bool> addNewInvoice(Invoice invoice) async {
    return await isar.writeTxn(() async {
      final id = invoice.id.isEmpty ? _randomId : invoice.id;
      invoice = invoice.copyWith(id: id);
      await isar.invoices.put(invoice);
      return true;
    });
  }

  @override
  Future<bool> updateInvoiceById(int id, Invoice invoice) async {
    return await isar.writeTxn(() async {
      await isar.invoices.put(invoice);
      await isar.invoices.delete(id);
      return true;
    });
  }

  String get _randomId {
    int randomUpperCase1 = Random().nextInt(26);
    int randomUpperCase2 = Random().nextInt(26);

    int randomNumber = Random().nextInt(10000);

    String randomDigits = randomNumber.toString().padLeft(4, '0');

    String randomUpperCase1Char =
        String.fromCharCode('A'.codeUnitAt(0) + randomUpperCase1);
    String randomUpperCase2Char =
        String.fromCharCode('A'.codeUnitAt(0) + randomUpperCase2);

    String randomString =
        '$randomUpperCase1Char$randomUpperCase2Char$randomDigits';

    return randomString;
  }
}

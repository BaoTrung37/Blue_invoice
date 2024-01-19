import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/local/isar_db/isar_database_repository.dart';
import 'package:invoice_app/data/model/invoice_collection.dart';
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
        InvoiceCollectionSchema,
      ],
      directory: dir.path,
    );
  }

  @override
  Future<void> loadFirstInvoice(String json) async {}

  @override
  Future<void> importJson() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });

    final jsonString = await rootBundle.loadString('assets/json/data.json');
    final jsonData = json.decode(jsonString).cast<Map<String, dynamic>>();

    await isar.writeTxn(() async {
      for (final itemData in jsonData) {
        final invoiceCollection = InvoiceCollection.fromJson(itemData);

        await isar.invoiceCollections.put(invoiceCollection);
      }
    });
  }
}

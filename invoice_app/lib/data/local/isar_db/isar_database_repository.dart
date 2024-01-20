import 'package:invoice_app/data/model/invoice.dart';

abstract class IsarDatabaseRepository {
  Future<void> initIsarDataBase();
  Future<void> importJson();
  Future<bool> clearDatabase();
  Future<List<Invoice>> getInvoices();
}

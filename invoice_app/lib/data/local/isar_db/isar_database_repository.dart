abstract class IsarDatabaseRepository {
  Future<void> initIsarDataBase();
  Future<void> importJson();
  Future<void> loadFirstInvoice(String json);
}

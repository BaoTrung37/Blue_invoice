import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/local/isar_db/isar_database.dart';
import 'package:invoice_app/domain/use_cases/use_case.dart';

@injectable
class DeleteInvoiceByIdUseCase implements FutureUseCase<int, bool> {
  final IsarDatabase isarDatabase;
  DeleteInvoiceByIdUseCase({
    required this.isarDatabase,
  });

  @override
  Future<bool> run(int id) {
    return isarDatabase.deleteInvoiceById(id);
  }
}

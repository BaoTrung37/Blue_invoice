// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/local/isar_db/isar_database.dart';
import 'package:invoice_app/data/model/invoice.dart';
import 'package:invoice_app/domain/use_cases/use_cases.dart';

@injectable
class GetInvoiceByIdUseCase implements FutureUseCase<String, Invoice?> {
  final IsarDatabase isarDatabase;
  GetInvoiceByIdUseCase({
    required this.isarDatabase,
  });

  @override
  Future<Invoice?> run(String invoiceId) {
    return isarDatabase.getInvoiceById(invoiceId);
  }
}

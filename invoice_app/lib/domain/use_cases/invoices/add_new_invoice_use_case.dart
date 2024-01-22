// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/local/isar_db/isar_database.dart';
import 'package:invoice_app/data/model/invoice.dart';
import 'package:invoice_app/domain/use_cases/use_cases.dart';

@injectable
class AddNewInvoiceUseCase implements FutureUseCase<Invoice, bool> {
  final IsarDatabase isarDatabase;
  AddNewInvoiceUseCase({
    required this.isarDatabase,
  });

  @override
  Future<bool> run(Invoice invoice) {
    return isarDatabase.addNewInvoice(invoice);
  }
}

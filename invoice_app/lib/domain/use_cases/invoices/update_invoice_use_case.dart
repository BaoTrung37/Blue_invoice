import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/local/isar_db/isar_database.dart';
import 'package:invoice_app/data/model/invoice.dart';
import 'package:invoice_app/domain/use_cases/use_case.dart';

@injectable
class UpdateInvoiceUseCase implements FutureUseCase<Invoice, bool> {
  final IsarDatabase isarDatabase;
  UpdateInvoiceUseCase({
    required this.isarDatabase,
  });

  @override
  Future<bool> run(Invoice invoice) {
    return isarDatabase.updateInvoice(invoice);
  }
}

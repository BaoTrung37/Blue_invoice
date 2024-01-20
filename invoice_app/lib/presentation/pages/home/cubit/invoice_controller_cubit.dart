// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/model/invoice.dart';
import 'package:invoice_app/domain/use_cases/invoices/get_all_invoices_use_case.dart';

import '../../../widgets/enums/loading_status.dart';

part 'invoice_controller_cubit.freezed.dart';
part 'invoice_controller_state.dart';

@lazySingleton
class InvoiceControllerCubit extends Cubit<InvoiceControllerState> {
  InvoiceControllerCubit(
    this.getAllInvoicesUseCase,
  ) : super(const InvoiceControllerState());

  final GetAllInvoicesUseCase getAllInvoicesUseCase;

  Future<void> initData() async {
    try {
      emit(state.copyWith(loadingStatus: LoadingStatus.process));

      final invoices = await getAllInvoicesUseCase.run();

      emit(state.copyWith(
        loadingStatus: LoadingStatus.success,
        invoices: invoices,
      ));
    } catch (e) {
      emit(state.copyWith(loadingStatus: LoadingStatus.error));
    }
  }
}

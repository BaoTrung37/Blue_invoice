part of 'invoice_controller_cubit.dart';

@freezed
class InvoiceControllerState with _$InvoiceControllerState {
  const factory InvoiceControllerState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default([]) List<Invoice> invoices,
  }) = _InvoiceControllerState;
}

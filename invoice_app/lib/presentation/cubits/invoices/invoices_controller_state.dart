part of 'invoices_controller_cubit.dart';

@freezed
class InvoicesControllerState with _$InvoicesControllerState {
  const factory InvoicesControllerState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default([]) List<Invoice> invoices,
    @Default(Invoice()) Invoice currentInvoice,
  }) = _InvoicesControllerState;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/model/invoice.dart';
import 'package:invoice_app/domain/use_cases/invoices/get_all_invoices_use_case.dart';

import '../../../widgets/enums/loading_status.dart';

part 'invoices_controller_cubit.freezed.dart';
part 'invoices_controller_state.dart';

@lazySingleton
class InvoicesControllerCubit extends Cubit<InvoicesControllerState> {
  InvoicesControllerCubit(
    this.getAllInvoicesUseCase,
  ) : super(const InvoicesControllerState());

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

  Future<void> changedBillFromAddress(String stressAddress) async {
    final senderAddress =
        state.templateInvoice?.senderAddress ?? const Address();

    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          senderAddress: senderAddress.copyWith(street: stressAddress),
        ),
      ),
    );
  }

  Future<void> changedBillFromCity(String city) async {
    final senderAddress =
        state.templateInvoice?.senderAddress ?? const Address();

    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          senderAddress: senderAddress.copyWith(city: city),
        ),
      ),
    );
  }

  Future<void> changedBillFormPostCode(String postCode) async {
    final senderAddress =
        state.templateInvoice?.senderAddress ?? const Address();

    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          senderAddress: senderAddress.copyWith(postCode: postCode),
        ),
      ),
    );
  }

  Future<void> changedBillFormCountry(String country) async {
    final senderAddress =
        state.templateInvoice?.senderAddress ?? const Address();

    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          senderAddress: senderAddress.copyWith(country: country),
        ),
      ),
    );
  }

  Future<void> changedBillToAddress(String stressAddress) async {
    final clientAddress =
        state.templateInvoice?.clientAddress ?? const Address();

    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          clientAddress: clientAddress.copyWith(street: stressAddress),
        ),
      ),
    );
  }

  Future<void> changedBillToCity(String city) async {
    final clientAddress =
        state.templateInvoice?.clientAddress ?? const Address();

    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          clientAddress: clientAddress.copyWith(city: city),
        ),
      ),
    );
  }

  Future<void> changedBillToPostCode(String postCode) async {
    final clientAddress =
        state.templateInvoice?.clientAddress ?? const Address();

    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          clientAddress: clientAddress.copyWith(postCode: postCode),
        ),
      ),
    );
  }

  Future<void> changedBillToCountry(String country) async {
    final clientAddress =
        state.templateInvoice?.clientAddress ?? const Address();

    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          clientAddress: clientAddress.copyWith(country: country),
        ),
      ),
    );
  }

  Future<void> changedBillToClientName(String clientName) async {
    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          clientName: clientName,
        ),
      ),
    );
  }

  Future<void> changedBillToClientEmail(String clientEmail) async {
    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          clientEmail: clientEmail,
        ),
      ),
    );
  }

  Future<void> changedBillToClientProjectDescription(
      String projectDescription) async {
    emit(
      state.copyWith(
        templateInvoice: state.templateInvoice?.copyWith(
          description: projectDescription,
        ),
      ),
    );
  }
}

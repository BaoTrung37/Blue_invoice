// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:invoice_app/data/local/isar_db/isar_database.dart';
import 'package:invoice_app/data/model/invoice.dart';
import 'package:invoice_app/domain/use_cases/invoices/invoices.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/presentation.dart';

part 'invoices_controller_cubit.freezed.dart';
part 'invoices_controller_state.dart';

@lazySingleton
class InvoicesControllerCubit extends Cubit<InvoicesControllerState> {
  InvoicesControllerCubit(
    this._getAllInvoicesUseCase,
    this._addNewInvoiceUseCase,
    this._deleteInvoiceByIdUseCase,
    this._updateInvoiceUseCase,
  ) : super(const InvoicesControllerState());

  final GetAllInvoicesUseCase _getAllInvoicesUseCase;
  final AddNewInvoiceUseCase _addNewInvoiceUseCase;
  final DeleteInvoiceByIdUseCase _deleteInvoiceByIdUseCase;
  final UpdateInvoiceUseCase _updateInvoiceUseCase;

  Future<void> fetchData() async {
    try {
      emit(state.copyWith(loadingStatus: LoadingStatus.process));

      final invoices = await _getAllInvoicesUseCase.run();

      emit(state.copyWith(
        loadingStatus: LoadingStatus.success,
        invoices: invoices,
      ));
    } catch (e) {
      emit(state.copyWith(loadingStatus: LoadingStatus.error));
    }
  }

  Future<void> importMockData() async {
    await getIt.get<IsarDatabase>().importJson();
    fetchData();
  }

  void setAndUpdateCurrentInvoice(Invoice invoice) {
    emit(state.copyWith(currentInvoice: invoice));
  }

  Future<bool> addInvoiceToDb({bool isDraft = false}) async {
    final status =
        isDraft ? InvoiceStatusType.draft.name : InvoiceStatusType.pending.name;
    try {
      final temporaryInvoice = state.currentInvoice.copyWith(
        status: status,
        createdAt: state.temporaryInvoice.createdAt ?? DateTime.now(),
      );

      final isAddSuccess = await _addNewInvoiceUseCase.run(temporaryInvoice);
      if (isAddSuccess) {
        emit(
          state.copyWith(
            currentInvoice: temporaryInvoice,
          ),
        );
        refreshTemplateData();
        return true;
      }
      return false;
    } catch (e) {
      //
    }
    return false;
  }

  Future<void> refreshTemplateData() async {
    await fetchData();
    clearTemporaryData();
  }

  void clearTemporaryData() {
    emit(state.copyWith(
      currentInvoice: const Invoice(),
      temporaryInvoice: const Invoice(),
    ));
  }

  void discardTemporaryChanged() {
    emit(state.copyWith(
      temporaryInvoice: state.currentInvoice,
    ));
  }

  Future<void> changedBillFromAddress(String stressAddress) async {
    final senderAddress = state.currentInvoice.senderAddress;

    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          senderAddress: senderAddress.copyWith(street: stressAddress),
        ),
      ),
    );
  }

  Future<void> changedBillFromCity(String city) async {
    final senderAddress = state.temporaryInvoice.senderAddress;

    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          senderAddress: senderAddress.copyWith(city: city),
        ),
      ),
    );
  }

  Future<void> changedBillFormPostCode(String postCode) async {
    final senderAddress = state.temporaryInvoice.senderAddress;

    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          senderAddress: senderAddress.copyWith(postCode: postCode),
        ),
      ),
    );
  }

  Future<void> changedBillFormCountry(String country) async {
    final senderAddress = state.temporaryInvoice.senderAddress;

    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          senderAddress: senderAddress.copyWith(country: country),
        ),
      ),
    );
  }

  Future<void> changedBillToAddress(String stressAddress) async {
    final clientAddress = state.temporaryInvoice.clientAddress;

    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          clientAddress: clientAddress.copyWith(street: stressAddress),
        ),
      ),
    );
  }

  Future<void> changedBillToCity(String city) async {
    final clientAddress = state.temporaryInvoice.clientAddress;

    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          clientAddress: clientAddress.copyWith(city: city),
        ),
      ),
    );
  }

  Future<void> changedBillToPostCode(String postCode) async {
    final clientAddress = state.temporaryInvoice.clientAddress;

    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          clientAddress: clientAddress.copyWith(postCode: postCode),
        ),
      ),
    );
  }

  Future<void> changedBillToCountry(String country) async {
    final clientAddress = state.temporaryInvoice.clientAddress;

    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          clientAddress: clientAddress.copyWith(country: country),
        ),
      ),
    );
  }

  Future<void> changedBillToClientName(String clientName) async {
    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          clientName: clientName,
        ),
      ),
    );
  }

  Future<void> changedBillToClientEmail(String clientEmail) async {
    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          clientEmail: clientEmail,
        ),
      ),
    );
  }

  Future<void> changedBillToClientCreateAt(DateTime createAt) async {
    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          createdAt: createAt,
        ),
      ),
    );
  }

  Future<void> changedBillToClientPaymentTerm(int paymentTerms) async {
    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          paymentTerms: paymentTerms,
        ),
      ),
    );
  }

  Future<void> changedBillToClientProjectDescription(
      String projectDescription) async {
    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          description: projectDescription,
        ),
      ),
    );
  }

  Future<void> addNewItem() async {
    final items = state.temporaryInvoice.items.toList();
    items.add(const Item());
    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          items: items,
        ),
      ),
    );
  }

  Future<void> removeItem(int index) async {
    final items = state.temporaryInvoice.items.toList();
    items.removeAt(index);
    emit(
      state.copyWith(
        temporaryInvoice: state.temporaryInvoice.copyWith(
          items: items,
        ),
      ),
    );
  }

  Future<void> updateItemName({
    required int index,
    required String itemName,
  }) async {
    var currentItem = state.temporaryInvoice.items[index];

    var updatedItem = currentItem.copyWith(
      name: itemName,
    );

    if (currentItem != updatedItem) {
      var items = List.of(state.temporaryInvoice.items);
      items[index] = updatedItem;

      emit(
        state.copyWith(
          temporaryInvoice: state.temporaryInvoice.copyWith(
            items: items,
          ),
        ),
      );
    }
  }

  Future<void> updateItemQuantity({
    required int index,
    required String quantityStr,
  }) async {
    var currentItem = state.temporaryInvoice.items[index];

    final quantity = quantityStr.parseToInt;
    var updatedItem = currentItem.copyWith(
      quantity: quantity,
    );

    if (currentItem != updatedItem) {
      var items = List.of(state.temporaryInvoice.items);
      items[index] = updatedItem;

      emit(
        state.copyWith(
          temporaryInvoice: state.temporaryInvoice.copyWith(
            items: items,
          ),
        ),
      );
    }
  }

  Future<void> updateItemPrice({
    required int index,
    required String priceStr,
  }) async {
    var currentItem = state.temporaryInvoice.items[index];

    final price = priceStr.parseToDouble;
    var updatedItem = currentItem.copyWith(
      price: price,
    );

    if (currentItem != updatedItem) {
      var items = List.of(state.temporaryInvoice.items);
      items[index] = updatedItem;

      emit(
        state.copyWith(
          temporaryInvoice: state.temporaryInvoice.copyWith(
            items: items,
          ),
        ),
      );
    }
  }

  Future<void> updateInvoice() async {
    try {
      emit(state.copyWith(loadingStatus: LoadingStatus.process));
      final temporaryInvoice = state.temporaryInvoice
          .copyWith(status: InvoiceStatusType.pending.name);

      final isUpdateSuccess = await _updateInvoiceUseCase.run(temporaryInvoice);

      if (isUpdateSuccess) {
        emit(state.copyWith(
          currentInvoice: temporaryInvoice,
          loadingStatus: LoadingStatus.success,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> deleteInvoice(String id) async {
    try {
      final isDeleteSuccess = await _deleteInvoiceByIdUseCase.run(id);
      if (isDeleteSuccess) {
        await fetchData();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}

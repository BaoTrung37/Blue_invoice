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

  void setCurrentInvoice(Invoice invoice) {
    emit(state.copyWith(currentInvoice: invoice));
  }

  Future<bool> addInvoiceToDb() async {
    try {
      final currentInvoice = state.currentInvoice.copyWith(
        status: InvoiceStatusType.daft.name,
      );

      final isAddSuccess = await _addNewInvoiceUseCase.run(currentInvoice);
      if (isAddSuccess) {
        emit(
          state.copyWith(
            currentInvoice: currentInvoice,
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
    clearTemplateData();
  }

  void clearTemplateData() {
    emit(state.copyWith(
      currentInvoice: const Invoice(),
    ));
  }

  Future<void> changedBillFromAddress(String stressAddress) async {
    final senderAddress = state.currentInvoice.senderAddress;

    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          senderAddress: senderAddress.copyWith(street: stressAddress),
        ),
      ),
    );
  }

  Future<void> changedBillFromCity(String city) async {
    final senderAddress = state.currentInvoice.senderAddress;

    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          senderAddress: senderAddress.copyWith(city: city),
        ),
      ),
    );
  }

  Future<void> changedBillFormPostCode(String postCode) async {
    final senderAddress = state.currentInvoice.senderAddress;

    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          senderAddress: senderAddress.copyWith(postCode: postCode),
        ),
      ),
    );
  }

  Future<void> changedBillFormCountry(String country) async {
    final senderAddress = state.currentInvoice.senderAddress;

    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          senderAddress: senderAddress.copyWith(country: country),
        ),
      ),
    );
  }

  Future<void> changedBillToAddress(String stressAddress) async {
    final clientAddress = state.currentInvoice.clientAddress;

    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          clientAddress: clientAddress.copyWith(street: stressAddress),
        ),
      ),
    );
  }

  Future<void> changedBillToCity(String city) async {
    final clientAddress = state.currentInvoice.clientAddress;

    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          clientAddress: clientAddress.copyWith(city: city),
        ),
      ),
    );
  }

  Future<void> changedBillToPostCode(String postCode) async {
    final clientAddress = state.currentInvoice.clientAddress;

    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          clientAddress: clientAddress.copyWith(postCode: postCode),
        ),
      ),
    );
  }

  Future<void> changedBillToCountry(String country) async {
    final clientAddress = state.currentInvoice.clientAddress;

    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          clientAddress: clientAddress.copyWith(country: country),
        ),
      ),
    );
  }

  Future<void> changedBillToClientName(String clientName) async {
    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          clientName: clientName,
        ),
      ),
    );
  }

  Future<void> changedBillToClientEmail(String clientEmail) async {
    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          clientEmail: clientEmail,
        ),
      ),
    );
  }

  Future<void> changedBillToClientCreateAt(DateTime createAt) async {
    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          createdAt: createAt,
        ),
      ),
    );
  }

  Future<void> changedBillToClientPaymentTerm(int paymentTerms) async {
    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          paymentTerms: paymentTerms,
        ),
      ),
    );
  }

  Future<void> changedBillToClientProjectDescription(
      String projectDescription) async {
    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          description: projectDescription,
        ),
      ),
    );
  }

  Future<void> addNewItem() async {
    final items = state.currentInvoice.items.toList();
    items.add(const Item());
    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          items: items,
        ),
      ),
    );
  }

  Future<void> removeItem(int index) async {
    final items = state.currentInvoice.items.toList();
    items.removeAt(index);
    emit(
      state.copyWith(
        currentInvoice: state.currentInvoice.copyWith(
          items: items,
        ),
      ),
    );
  }

  Future<void> updateItemName({
    required int index,
    required String itemName,
  }) async {
    var currentItem = state.currentInvoice.items[index];

    var updatedItem = currentItem.copyWith(
      name: itemName,
    );

    if (currentItem != updatedItem) {
      var items = List.of(state.currentInvoice.items);
      items[index] = updatedItem;

      emit(
        state.copyWith(
          currentInvoice: state.currentInvoice.copyWith(
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
    var currentItem = state.currentInvoice.items[index];

    final quantity = quantityStr.parseToInt;
    var updatedItem = currentItem.copyWith(
      quantity: quantity,
    );

    if (currentItem != updatedItem) {
      var items = List.of(state.currentInvoice.items);
      items[index] = updatedItem;

      emit(
        state.copyWith(
          currentInvoice: state.currentInvoice.copyWith(
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
    var currentItem = state.currentInvoice.items[index];

    final price = priceStr.parseToDouble;
    var updatedItem = currentItem.copyWith(
      price: price,
    );

    if (currentItem != updatedItem) {
      var items = List.of(state.currentInvoice.items);
      items[index] = updatedItem;

      emit(
        state.copyWith(
          currentInvoice: state.currentInvoice.copyWith(
            items: items,
          ),
        ),
      );
    }
  }

  Future<bool> updateInvoice(Invoice invoice) async {
    try {
      // return await deleteInvoiceByIdUseCase.run(id);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
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

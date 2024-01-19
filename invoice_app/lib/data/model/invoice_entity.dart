import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_entity.freezed.dart';
part 'invoice_entity.g.dart';

@freezed
class InvoiceEntity with _$InvoiceEntity {
  const factory InvoiceEntity({
    required String id,
    required DateTime createdAt,
    required DateTime paymentDue,
    required String description,
    required int paymentTerms,
    required String clientName,
    required String clientEmail,
    required String status,
    required Address senderAddress,
    required Address clientAddress,
    required List<Item> items,
    required double total,
  }) = _InvoiceEntity;

  factory InvoiceEntity.fromJson(Map<String, dynamic> json) =>
      _$InvoiceEntityFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    required String street,
    required String city,
    required String postCode,
    required String country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String name,
    required int quantity,
    required double price,
    required double total,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invoice_app/data/local/isar_db/isar_extension.dart';
import 'package:isar/isar.dart';

part 'invoice_collection.freezed.dart';
part 'invoice_collection.g.dart';

@freezed
@collectionOnFreezed
class InvoiceCollection with _$InvoiceCollection {
  const InvoiceCollection._();
  const factory InvoiceCollection({
    @Index(unique: true) required String id,
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
  }) = _InvoiceCollection;

  Id get invoiceId => Isar.autoIncrement;

  factory InvoiceCollection.fromJson(Map<String, dynamic> json) =>
      _$InvoiceCollectionFromJson(json);
}

@freezed
@Embedded(ignore: {'copyWith'})
class Address with _$Address {
  const factory Address({
    String? street,
    String? city,
    String? postCode,
    String? country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
@Embedded(ignore: {'copyWith'})
class Item with _$Item {
  const factory Item({
    String? name,
    int? quantity,
    double? price,
    double? total,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

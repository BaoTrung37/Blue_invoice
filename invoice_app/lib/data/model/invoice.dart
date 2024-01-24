// ignore_for_file: invalid_annotation_target

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invoice_app/data/local/isar_db/isar_extension.dart';
import 'package:invoice_app/presentation/presentation.dart';
import 'package:isar/isar.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
@collectionOnFreezed
class Invoice with _$Invoice {
  const Invoice._();
  const factory Invoice({
    @Index(unique: true, replace: true) @Default('') String id,
    @Default('') String description,
    @Default('') String clientName,
    @Default('') String clientEmail,
    @Default('') String status,
    @Default(Address()) Address senderAddress,
    @Default(Address()) Address clientAddress,
    @Default(1) int paymentTerms,
    @Default(0) double total,
    DateTime? createdAt,
    @Default([]) List<Item> items,
  }) = _InvoiceCollection;

  Id get invoiceId => Isar.autoIncrement;

  @Index()
  DateTime? get paymentDue => createdAt?.add(Duration(days: paymentTerms));

  @override
  @Index()
  double get total => items.fold<double>(0, (previousValue, element) {
        return previousValue + (element.total ?? 0);
      });

  @enumerated
  InvoiceStatusType get invoiceStatus =>
      InvoiceStatusType.values.firstWhereOrNull(
          (element) => element.name.toLowerCase() == status.toLowerCase()) ??
      InvoiceStatusType.draft;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
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
  const Item._();
  const factory Item({
    String? name,
    int? quantity,
    double? price,
  }) = _Item;

  bool get isNotFieldBlank => name != null && quantity != null && price != null;

  double? get total {
    if (price != null && quantity != null) {
      return price! * quantity!;
    }
    return null;
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

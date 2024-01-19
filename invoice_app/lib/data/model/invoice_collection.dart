// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:invoice_app/data/local/isar_db/isar_extension.dart';
import 'package:invoice_app/data/model/invoice_entity.dart';
import 'package:isar/isar.dart';

part 'invoice_collection.g.dart';

@collection
class InvoiceCollection {
  Id get isarId => fastHash(id);

  @Index(unique: true)
  final String id;

  final DateTime createdAt;
  final DateTime paymentDue;
  final String description;
  final int paymentTerms;
  final String clientName;
  final String clientEmail;
  final String status;
  Address? senderAddress;
  Address? clientAddress;
  List<Item>? items;
  final double total;
  InvoiceCollection({
    required this.id,
    required this.createdAt,
    required this.paymentDue,
    required this.description,
    required this.paymentTerms,
    required this.clientName,
    required this.clientEmail,
    required this.status,
    this.senderAddress,
    this.clientAddress,
    this.items,
    required this.total,
  });
}

@embedded
class Address {
  final String? street;
  final String? city;
  final String? postCode;
  final String? country;
  Address({
    this.street,
    this.city,
    this.postCode,
    this.country,
  });
}

@embedded
class Item {
  final String? name;
  final int? quantity;
  final double? price;
  final double? total;
  Item({
    this.name,
    this.quantity,
    this.price,
    this.total,
  });
}

InvoiceCollection getInvoiceCollectionFromInvoiceEntity(
    InvoiceEntity invoiceEntity) {
  return InvoiceCollection(
    id: invoiceEntity.id,
    createdAt: invoiceEntity.createdAt,
    paymentDue: invoiceEntity.paymentDue,
    description: invoiceEntity.description,
    paymentTerms: invoiceEntity.paymentTerms,
    clientName: invoiceEntity.clientName,
    clientEmail: invoiceEntity.clientEmail,
    status: invoiceEntity.status,
    total: invoiceEntity.total,
  );
}

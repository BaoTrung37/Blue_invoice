enum InvoiceStatusType {
  daft,
  pending,
  paid,
}

extension InvoiceStatusTypeEx on InvoiceStatusType {
  String get name {
    switch (this) {
      case InvoiceStatusType.daft:
        return 'Daft';
      case InvoiceStatusType.pending:
        return 'Pending';
      case InvoiceStatusType.paid:
        return 'Paid';
    }
  }
}

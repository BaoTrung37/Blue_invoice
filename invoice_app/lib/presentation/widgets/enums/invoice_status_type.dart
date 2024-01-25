enum InvoiceStatusType {
  draft,
  pending,
  paid,
}

extension InvoiceStatusTypeEx on InvoiceStatusType {
  String get name {
    switch (this) {
      case InvoiceStatusType.draft:
        return 'Draft';
      case InvoiceStatusType.pending:
        return 'Pending';
      case InvoiceStatusType.paid:
        return 'Paid';
    }
  }
}

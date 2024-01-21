enum PaymentTermsType {
  net1Day,
  net7Days,
  net15Days,
  net30Days,
}

extension PaymentTermsTypeEx on PaymentTermsType {
  String get name {
    switch (this) {
      case PaymentTermsType.net1Day:
        return 'Net 1 Day';
      case PaymentTermsType.net7Days:
        return 'Net 7 Days';
      case PaymentTermsType.net15Days:
        return 'Net 15 Days';
      case PaymentTermsType.net30Days:
        return 'Net 30 Days';
    }
  }

  int get timePlus {
    switch (this) {
      case PaymentTermsType.net1Day:
        return 1;
      case PaymentTermsType.net7Days:
        return 7;
      case PaymentTermsType.net15Days:
        return 15;
      case PaymentTermsType.net30Days:
        return 30;
    }
  }
}

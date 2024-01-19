// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/presentation/resources/resources.dart';

import '../widgets.dart';

class InvoiceStatusButton extends StatelessWidget {
  const InvoiceStatusButton({
    Key? key,
    this.invoiceStatusType = InvoiceStatusType.daft,
  }) : super(key: key);

  final InvoiceStatusType invoiceStatusType;

  Color _getTextColor() {
    switch (invoiceStatusType) {
      case InvoiceStatusType.daft:
        return const Color(0xFFDFE3F9);
      case InvoiceStatusType.pending:
        return const Color(0xFFF78E05);
      case InvoiceStatusType.paid:
        return const Color(0xFF43D69E);
    }
  }

  Color _getBackgroundColor() {
    switch (invoiceStatusType) {
      case InvoiceStatusType.daft:
        return const Color(0xFF2A2C43);
      case InvoiceStatusType.pending:
        return const Color(0xFF2C2735);
      case InvoiceStatusType.paid:
        return const Color(0xFF234950);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Center(
        child: Text(
          '● ${invoiceStatusType.name}',
          style: AppTextStyles.body1.copyWith(
            color: _getTextColor(),
          ),
        ),
      ),
    );
  }
}

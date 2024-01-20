// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/data/model/invoice.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/presentation/utilities/extensions/date_time_extension.dart';

import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        color: context.colors.backgroundSecondary,
        child: Row(
          children: [
            Row(
              children: [
                Text(
                  '#',
                  style: AppTextStyles.body1.copyWith(
                    color: const Color(0xFF7E88C3),
                  ),
                ),
                Text(
                  invoice.id,
                  style: AppTextStyles.hs3,
                ),
              ],
            ),
            8.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    invoice.clientName,
                    style: AppTextStyles.hs3,
                  ),
                  Text(
                    invoice.paymentDue.formatddMMMyyyy,
                    style: AppTextStyles.hs3,
                  ),
                ],
              ),
            ),
            4.horizontalSpace,
            Text(
              '£ ${invoice.total.toStringAsFixed(2)}',
              style: AppTextStyles.hs3,
            ),
            18.horizontalSpace,
            InvoiceStatusButton(
              invoiceStatusType: invoice.invoiceStatus,
            ),
            8.horizontalSpace,
            Assets.icons.iconArrowRight.svg(height: 11.h),
          ],
        ),
      ),
    );
  }
}

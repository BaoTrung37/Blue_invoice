import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';

import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
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
                const Text(
                  'RT3080',
                  style: AppTextStyles.hs3,
                ),
              ],
            ),
            8.horizontalSpace,
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jensen Huang',
                    style: AppTextStyles.hs3,
                  ),
                  Text(
                    'Due 19 Aug 2021',
                    style: AppTextStyles.hs3,
                  ),
                ],
              ),
            ),
            4.horizontalSpace,
            const Text(
              '1000',
              style: AppTextStyles.hs3,
            ),
            18.horizontalSpace,
            const InvoiceStatusButton(
              invoiceStatusType: InvoiceStatusType.pending,
            ),
            8.horizontalSpace,
            Assets.icons.iconArrowRight.svg(height: 11.h),
          ],
        ),
      ),
    );
  }
}

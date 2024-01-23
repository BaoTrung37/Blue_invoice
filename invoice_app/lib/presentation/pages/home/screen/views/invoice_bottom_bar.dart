import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/cubits/cubits.dart';
import 'package:invoice_app/presentation/resources/resources.dart';

import '../../widgets/widgets.dart';

class InvoiceBottomBar extends StatelessWidget {
  const InvoiceBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h),
      height: 60.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            backgroundColor: const Color(0xFFF9FAFE),
            onTap: () {},
            child: Text(
              'Discard',
              style: AppTextStyles.body1.copyWith(
                color: const Color(0xFF828DC5),
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              getIt.get<InvoicesControllerCubit>().addInvoiceToDb().then(
                    (value) => Navigator.of(context).pop(),
                  );
            },
            backgroundColor: const Color(0xFF373B54),
            child: Text(
              'Save as Daft',
              style: AppTextStyles.body1.copyWith(
                color: const Color(0xFFDEE3F9),
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              //
            },
            backgroundColor: const Color(0xFF7C5DF9),
            child: Text(
              'Save & Send',
              style: AppTextStyles.body1.copyWith(
                color: const Color(0xFFFEFEFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

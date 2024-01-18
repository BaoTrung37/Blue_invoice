import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/presentation/resources/app_colors.dart';
import 'package:invoice_app/presentation/resources/app_text_styles.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              _buildHeading(),
              24.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                color: context.colors.backgroundSecondary,
                child: Row(
                  children: [
                    const Text('RT3080'),
                    4.horizontalSpace,
                    const Text('Jensen Huang'),
                    4.horizontalSpace,
                    const Column(
                      children: [
                        Text('Due 19 Aug 2021'),
                        Text('1000'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildNewInvoiceButton(context),
    );
  }

  Widget _buildHeading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invoices',
              style: AppTextStyles.heading1,
            ),
            8.verticalSpace,
            const Text('No Invoices'),
          ],
        ),
        Row(
          children: [
            const Text('Filter by status'),
            8.horizontalSpace,
            Assets.icons.iconArrowDown.svg(
              height: 12.h,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewInvoiceButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.button1Color,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(6.r),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 15.r,
            backgroundColor: context.colors.lightBackground,
            child: Assets.icons.iconPlus.svg(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const Text(
              'New Invoice',
              style: AppTextStyles.body1,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/presentation/pages/home/widgets/invoice_item.dart';
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
              const _MainContent(),
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
              style: AppTextStyles.h1,
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

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return _buildInvoiceList();
    // return _buildEmptyInvoiceList();
  }

  Widget _buildInvoiceList() {
    return Column(
      children: [
        const InvoiceItem(),
        24.verticalSpace,
        const InvoiceItem(),
        24.verticalSpace,
        const InvoiceItem(),
      ],
    );
  }

  Widget _buildEmptyInvoiceList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          Assets.icons.illustrationEmpty.svg(height: 150.h),
          24.verticalSpace,
          const Text(
            'There is nothing here',
            style: AppTextStyles.h2,
          ),
          24.verticalSpace,
          RichText(
            text: TextSpan(
              text: 'Create an invoice by click the ',
              children: [
                TextSpan(
                  text: 'New Invoice ',
                  style: AppTextStyles.body1.copyWith(
                    color: const Color(0xFFCED3E9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: 'button and get started'),
              ],
              style: AppTextStyles.body1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

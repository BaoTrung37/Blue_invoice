import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/presentation/pages/home/widgets/custom_button.dart';
import 'package:invoice_app/presentation/resources/app_colors.dart';
import 'package:invoice_app/presentation/resources/app_text_styles.dart';
import 'package:invoice_app/presentation/widgets/app_text_field/app_text_field.dart';

import '../../../../gen/assets.gen.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({super.key});

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colors.backgroundPrimary,
      body: const _MainContent(),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

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
            onTap: () {
              //
            },
            child: Text(
              'Discard',
              style: AppTextStyles.body1.copyWith(
                color: const Color(0xFF828DC5),
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              //
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

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        children: [
          const Text(
            'Create Invoice',
            style: AppTextStyles.h2,
          ),
          24.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildBillFrom(),
                    24.verticalSpace,
                    _buildBillTo(),
                    24.verticalSpace,
                    _buildItemList(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillFrom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Bill Form', style: AppTextStyles.h3),
        16.verticalSpace,
        const AppTextField(
          title: 'Stress Address',
        ),
        16.verticalSpace,
        Row(
          children: [
            const Expanded(
              child: AppTextField(
                title: 'City',
              ),
            ),
            16.horizontalSpace,
            const Expanded(
              child: AppTextField(
                title: 'Post Code',
              ),
            ),
            16.horizontalSpace,
            const Expanded(
              child: AppTextField(
                title: 'Country',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBillTo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Bill To', style: AppTextStyles.h3),
        16.verticalSpace,
        const AppTextField(
          title: 'Client\'s Name',
        ),
        16.verticalSpace,
        const AppTextField(
          title: 'Client\'s Email',
        ),
        16.verticalSpace,
        const AppTextField(
          title: 'String Address',
        ),
        16.verticalSpace,
        Row(
          children: [
            const Expanded(
              child: AppTextField(
                title: 'City',
              ),
            ),
            16.horizontalSpace,
            const Expanded(
              child: AppTextField(
                title: 'Post Code',
              ),
            ),
            16.horizontalSpace,
            const Expanded(
              child: AppTextField(
                title: 'Country',
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Row(
          children: [
            const Expanded(
              child: AppTextField(
                title: 'Issue Date',
              ),
            ),
            16.horizontalSpace,
            const Expanded(
              child: AppTextField(
                title: 'Payment Terms',
              ),
            ),
          ],
        ),
        16.verticalSpace,
        const AppTextField(
          title: 'Project Description',
        ),
      ],
    );
  }

  Widget _buildItemList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Item List', style: AppTextStyles.h2),
        16.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 6,
              child: Text('Item Name'),
            ),
            8.horizontalSpace,
            const Expanded(
              flex: 2,
              child: Text('Qty.'),
            ),
            8.horizontalSpace,
            const Expanded(
              flex: 3,
              child: Text('Price'),
            ),
            8.horizontalSpace,
            const Expanded(
              flex: 3,
              child: Text('Total'),
            ),
            8.horizontalSpace,
            const Expanded(
              flex: 1,
              child: SizedBox.shrink(),
            ),
          ],
        ),
        8.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 6,
              child: AppTextField(),
            ),
            8.horizontalSpace,
            const Expanded(
              flex: 2,
              child: AppTextField(),
            ),
            8.horizontalSpace,
            const Expanded(
              flex: 3,
              child: AppTextField(),
            ),
            8.horizontalSpace,
            const Expanded(
              flex: 3,
              child: AppTextField(
                isReadOnly: true,
              ),
            ),
            8.horizontalSpace,
            Expanded(
              flex: 1,
              child: Assets.icons.iconDelete.svg(),
            ),
          ],
        ),
        24.verticalSpace,
        CustomButton(
          onTap: () {
            //
          },
          backgroundColor: context.colors.backgroundSecondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.iconPlus.svg(),
              4.horizontalSpace,
              const Text('Add New Item'),
            ],
          ),
        ),
      ],
    );
  }
}

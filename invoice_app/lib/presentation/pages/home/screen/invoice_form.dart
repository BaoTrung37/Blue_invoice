import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/presentation/resources/app_text_styles.dart';
import 'package:invoice_app/presentation/widgets/app_text_field/app_text_field.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({super.key});

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildBillFrom(),
                24.verticalSpace,
                _buildBillFrom(),
                24.verticalSpace,
                _buildBillFrom(),
              ],
            ),
          ),
        ),
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
}

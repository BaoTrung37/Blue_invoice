// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/pages/home/cubit/invoices_controller_cubit.dart';
import 'package:invoice_app/presentation/pages/home/screen/views/invoice_bottom_bar.dart';
import 'package:invoice_app/presentation/pages/home/screen/views/payment_due_to_time_view.dart';
import 'package:invoice_app/presentation/presentation.dart';
import 'package:invoice_app/presentation/resources/app_colors.dart';
import 'package:invoice_app/presentation/resources/app_text_styles.dart';

import 'views/item_list_view.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({super.key});

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  late final GlobalKey<FormState> _keyForm;
  @override
  void initState() {
    super.initState();
    _keyForm = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colors.backgroundPrimary,
      body: _MainContent(keyForm: _keyForm),
      bottomNavigationBar: const InvoiceBottomBar(),
    );
  }
}

class _MainContent extends StatelessWidget {
  final GlobalKey<FormState> keyForm;
  const _MainContent({
    Key? key,
    required this.keyForm,
  }) : super(key: key);

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
                key: keyForm,
                child: GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildBillFrom(),
                      24.verticalSpace,
                      _buildBillTo(),
                      24.verticalSpace,
                      const ItemListView(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillFrom() {
    return BlocBuilder<InvoicesControllerCubit, InvoicesControllerState>(
      bloc: getIt<InvoicesControllerCubit>(),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Bill Form', style: AppTextStyles.h3),
            16.verticalSpace,
            AppTextField(
              title: 'Stress Address',
              initialText: state.currentInvoice.senderAddress.street,
              onTextChange: (value) {
                getIt<InvoicesControllerCubit>().changedBillFromAddress(value!);
              },
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    title: 'City',
                    initialText: state.currentInvoice.senderAddress.city,
                    onTextChange: (value) {
                      getIt<InvoicesControllerCubit>()
                          .changedBillFromCity(value!);
                    },
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Post Code',
                    initialText: state.currentInvoice.senderAddress.postCode,
                    onTextChange: (value) {
                      getIt<InvoicesControllerCubit>()
                          .changedBillFormPostCode(value!);
                    },
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Country',
                    initialText: state.currentInvoice.senderAddress.country,
                    onTextChange: (value) {
                      getIt<InvoicesControllerCubit>()
                          .changedBillFormCountry(value!);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildBillTo() {
    return BlocBuilder<InvoicesControllerCubit, InvoicesControllerState>(
      bloc: getIt<InvoicesControllerCubit>(),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Bill To', style: AppTextStyles.h3),
            16.verticalSpace,
            AppTextField(
              title: 'Client\'s Name',
              initialText: state.currentInvoice.clientName,
              onTextChange: (value) {
                getIt<InvoicesControllerCubit>()
                    .changedBillToClientName(value!);
              },
            ),
            16.verticalSpace,
            AppTextField(
              title: 'Client\'s Email',
              initialText: state.currentInvoice.clientEmail,
              onTextChange: (value) {
                getIt<InvoicesControllerCubit>()
                    .changedBillToClientEmail(value!);
              },
            ),
            16.verticalSpace,
            AppTextField(
              title: 'Street Address',
              initialText: state.currentInvoice.clientAddress.street,
              onTextChange: (value) {
                getIt<InvoicesControllerCubit>().changedBillToAddress(value!);
              },
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    title: 'City',
                    initialText: state.currentInvoice.clientAddress.city,
                    onTextChange: (value) {
                      getIt<InvoicesControllerCubit>()
                          .changedBillToCity(value!);
                    },
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Post Code',
                    initialText: state.currentInvoice.clientAddress.postCode,
                    onTextChange: (value) {
                      getIt<InvoicesControllerCubit>()
                          .changedBillToPostCode(value!);
                    },
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Country',
                    initialText: state.currentInvoice.clientAddress.country,
                    onTextChange: (value) {
                      getIt<InvoicesControllerCubit>()
                          .changedBillToCountry(value!);
                    },
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            const PaymentDueToTimeView(),
            16.verticalSpace,
            AppTextField(
              title: 'Project Description',
              initialText: state.currentInvoice.description,
              onTextChange: (value) {
                getIt<InvoicesControllerCubit>()
                    .changedBillToClientProjectDescription(value!);
              },
            ),
          ],
        );
      },
    );
  }
}

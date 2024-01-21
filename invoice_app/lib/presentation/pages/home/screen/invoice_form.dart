// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/pages/home/cubit/invoices_controller_cubit.dart';
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
      bottomNavigationBar: const _BottomNavigationBar(),
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
                      _buildItemList(context),
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

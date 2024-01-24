// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/pages/home/screen/views/payment_due_to_time_view.dart';
import 'package:invoice_app/presentation/presentation.dart';
import 'package:invoice_app/presentation/resources/app_colors.dart';
import 'package:invoice_app/presentation/resources/app_text_styles.dart';

import '../widgets/widgets.dart';
import 'views/item_list_view.dart';

void showInvoiceFormBottomSheet(
  BuildContext context, {
  bool isEdit = false,
}) {
  showModalBottomSheet(
    elevation: 2,
    context: context,
    scrollControlDisabledMaxHeightRatio: 1,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height * 0.7,
    ),
    builder: (context) => InvoiceForm(
      isEdit: isEdit,
    ),
  );
}

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({
    Key? key,
    this.isEdit = false,
  }) : super(key: key);

  final bool isEdit;
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

  bool validateForm() {
    if (_keyForm.currentState?.validate() == false) {
      return false;
    }
    return true;
  }

  void onAddInvoiceToDb() {
    // final isValidate = validateForm();
    // if (isValidate) {
    //   getIt.get<InvoicesControllerCubit>().addInvoiceToDb(true).then(
    //         (value) => context.popRoute(),
    //       );
    // } else {
    //   showAppDialog(
    //     context,
    //     title: 'Confirmation',
    //     content:
    //         'You haven\'t filled in all the information. Please filled the form.',
    //     actions: [
    //       ActionAppDialog(
    //         actionDialogTitle: 'OK',
    //         onAction: (context) async {
    //           context.popRoute();
    //         },
    //       ),
    //     ],
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colors.backgroundPrimary,
      body: _MainContent(keyForm: _keyForm),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return widget.isEdit
        ? _buildEditHandleView(context)
        : _buildCreateHandleView(context);
  }

  Widget _buildCreateHandleView(BuildContext context) {
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
              getIt.get<InvoicesControllerCubit>().refreshTemplateData().then(
                    (value) => Navigator.of(context).pop(),
                  );
            },
            child: Text(
              'Discard',
              style: AppTextStyles.hs3.copyWith(
                color: const Color(0xFF828DC5),
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              getIt
                  .get<InvoicesControllerCubit>()
                  .addInvoiceToDb(isSend: false)
                  .then(
                    (value) => context.popRoute(),
                  );
            },
            backgroundColor: const Color(0xFF373B54),
            child: Text(
              'Save as Draft',
              style: AppTextStyles.hs3.copyWith(
                color: const Color(0xFFDEE3F9),
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              getIt
                  .get<InvoicesControllerCubit>()
                  .addInvoiceToDb(isSend: true)
                  .then(
                    (value) => context.popRoute(),
                  );
            },
            backgroundColor: const Color(0xFF7C5DF9),
            child: Text(
              'Save & Send',
              style: AppTextStyles.hs3.copyWith(
                color: const Color(0xFFFEFEFF),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditHandleView(BuildContext context) {
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
              // getIt.get<InvoicesControllerCubit>().refreshTemplateData().then(
              //       (value) => context.popRoute(),
              //     );
              context.popRoute();
            },
            child: Text(
              'Cancel',
              style: AppTextStyles.hs3.copyWith(
                color: const Color(0xFF828DC5),
              ),
            ),
          ),
          CustomButton(
            onTap: () {
              getIt
                  .get<InvoicesControllerCubit>()
                  .addInvoiceToDb(isSend: false)
                  .then(
                    (value) => context.popRoute(),
                  );
            },
            backgroundColor: const Color(0xFF373B54),
            child: Text(
              'Save changed',
              style: AppTextStyles.hs3.copyWith(
                color: const Color(0xFFDEE3F9),
              ),
            ),
          ),
        ],
      ),
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
              title: 'Street Address',
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

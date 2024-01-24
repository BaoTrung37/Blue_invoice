import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/navigation/app_router.dart';
import 'package:invoice_app/presentation/pages/home/screen/views/item_list_view.dart';
import 'package:invoice_app/presentation/pages/home/widgets/custom_button.dart';
import 'package:invoice_app/presentation/presentation.dart';
import 'package:invoice_app/presentation/resources/resources.dart';
import 'package:invoice_app/presentation/widgets/dialog/app_dialog.dart';

@RoutePage()
class InvoiceDetailScreen extends StatelessWidget {
  const InvoiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.router.pop();
          },
          child: Center(
            child: Assets.icons.iconArrowLeft.svg(
              height: 20.h,
            ),
          ),
        ),
        backgroundColor: context.colors.backgroundPrimary,
        title: const Text('Go back'),
      ),
      body: const _MainContent(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return BlocBuilder<InvoicesControllerCubit, InvoicesControllerState>(
      bloc: getIt.get<InvoicesControllerCubit>(),
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(bottom: 16.h),
          height: 65.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onTap: () {
                  //
                },
                backgroundColor: const Color(0xFF373B54),
                child: Text(
                  'Edit',
                  style: AppTextStyles.hs3.copyWith(
                    color: const Color(0xFFDEE3F9),
                  ),
                ),
              ),
              CustomButton(
                backgroundColor: const Color(0xFFEC5757),
                onTap: () {
                  showAppDialog(
                    context,
                    title: 'Confirm Deletion',
                    content:
                        'Are you sure you want to delete invoice #${state.currentInvoice.id}? This action cannot be undone.',
                    actions: [
                      ActionAppDialog(
                        actionDialogTitle: 'Delete',
                        onAction: (context) {
                          getIt
                              .get<InvoicesControllerCubit>()
                              .deleteInvoice(state.currentInvoice.id)
                              .then((value) {
                            context.router
                                .popUntilRouteWithName(HomeRoute.name);
                          });
                        },
                      ),
                      ActionAppDialog(
                        actionDialogTitle: 'Cancel',
                        onAction: (context) {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
                child: Text(
                  'Delete',
                  style: AppTextStyles.hs3.copyWith(
                    color: const Color(0xFFFEFEFF),
                  ),
                ),
              ),
              CustomButton(
                onTap: () {
                  getIt.get<InvoicesControllerCubit>();
                },
                backgroundColor: const Color(0xFF7C5DF9),
                child: Text(
                  'Make as Paid',
                  style: AppTextStyles.hs3.copyWith(
                    color: const Color(0xFFFEFEFF),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Status: ',
                        style: AppTextStyles.h3,
                      ),
                      8.horizontalSpace,
                      BlocBuilder<InvoicesControllerCubit,
                          InvoicesControllerState>(
                        bloc: getIt.get<InvoicesControllerCubit>(),
                        builder: (context, state) {
                          return InvoiceStatusButton(
                            invoiceStatusType:
                                state.currentInvoice.invoiceStatus,
                          );
                        },
                      ),
                    ],
                  ),
                  _buildBillFrom(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.h),
                    height: 1,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  _buildBillTo(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.h),
                    height: 1,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  const ItemListView(isReadOnly: true),
                ],
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
              isReadOnly: true,
              initialText: state.currentInvoice.senderAddress.street,
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    title: 'City',
                    initialText: state.currentInvoice.senderAddress.city,
                    isReadOnly: true,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Post Code',
                    initialText: state.currentInvoice.senderAddress.postCode,
                    isReadOnly: true,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Country',
                    initialText: state.currentInvoice.senderAddress.country,
                    isReadOnly: true,
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
              isReadOnly: true,
            ),
            16.verticalSpace,
            AppTextField(
              title: 'Client\'s Email',
              initialText: state.currentInvoice.clientEmail,
              isReadOnly: true,
            ),
            16.verticalSpace,
            AppTextField(
              title: 'Street Address',
              initialText: state.currentInvoice.clientAddress.street,
              isReadOnly: true,
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    title: 'City',
                    initialText: state.currentInvoice.clientAddress.city,
                    isReadOnly: true,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Post Code',
                    initialText: state.currentInvoice.clientAddress.postCode,
                    isReadOnly: true,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Country',
                    initialText: state.currentInvoice.clientAddress.country,
                    isReadOnly: true,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    title: 'Invoice Date',
                    initialText:
                        state.currentInvoice.createdAt?.formatddMMMyyyy,
                    isReadOnly: true,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    title: 'Payment Due',
                    initialText:
                        state.currentInvoice.paymentDue?.formatddMMMyyyy,
                    isReadOnly: true,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            AppTextField(
              title: 'Project Description',
              initialText: state.currentInvoice.description,
              isReadOnly: true,
            ),
          ],
        );
      },
    );
  }
}

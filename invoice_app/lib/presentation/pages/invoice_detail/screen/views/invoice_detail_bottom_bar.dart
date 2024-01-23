import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/cubits/invoices/invoices_controller_cubit.dart';
import 'package:invoice_app/presentation/pages/home/widgets/custom_button.dart';
import 'package:invoice_app/presentation/resources/resources.dart';
import 'package:invoice_app/presentation/widgets/dialog/app_dialog.dart';

class InvoiceDetailBottomBar extends StatelessWidget {
  const InvoiceDetailBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                onTap: () {},
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
                        onAction: (context) {},
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
                  //
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

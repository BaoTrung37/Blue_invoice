import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/pages/home/cubit/invoices_controller_cubit.dart';
import 'package:invoice_app/presentation/resources/resources.dart';
import 'package:invoice_app/presentation/utilities/extensions/date_time_extension.dart';
import 'package:invoice_app/presentation/widgets/enums/payment_term.dart';

class PaymentDueToTimeView extends StatelessWidget {
  const PaymentDueToTimeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Issue Date',
                style: AppTextStyles.h3,
              ),
              8.verticalSpace,
              GestureDetector(
                child: BlocBuilder<InvoicesControllerCubit,
                    InvoicesControllerState>(
                  bloc: getIt.get<InvoicesControllerCubit>(),
                  builder: (context, state) {
                    return _buildCreateTimePicker(context, state);
                  },
                ),
              ),
            ],
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Issue Date',
                style: AppTextStyles.h3,
              ),
              8.verticalSpace,
              GestureDetector(
                child: BlocBuilder<InvoicesControllerCubit,
                    InvoicesControllerState>(
                  bloc: getIt.get<InvoicesControllerCubit>(),
                  builder: (context, state) {
                    return _buildPaymentTermDropdown(context, state);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentTermDropdown(
      BuildContext context, InvoicesControllerState state) {
    return Container(
      color: context.colors.backgroundSecondary,
      height: 50.h,
      child: DropdownButtonFormField2<int>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.backgroundSecondary,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.backgroundSecondary,
              width: 0.5,
            ),
          ),
          errorBorder: InputBorder.none,
        ),
        hint: const Text(
          'Payment Term',
          style: AppTextStyles.body1,
        ),
        value: state.currentInvoice.paymentTerms,
        items: PaymentTermsType.values
            .map((item) => DropdownMenuItem<int>(
                  value: item.timePlus,
                  child: Text(
                    item.name,
                    style: AppTextStyles.body1,
                  ),
                ))
            .toList(),
        onChanged: (value) {
          getIt
              .get<InvoicesControllerCubit>()
              .changedBillToClientPaymentTerm(value!);
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(right: 8.h),
        ),
        iconStyleData: IconStyleData(
          icon: Assets.icons.iconArrowDown.svg(
            height: 12.h,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
      ),
    );
  }

  Widget _buildCreateTimePicker(
      BuildContext context, InvoicesControllerState state) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        final dateTime = await showDatePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          lastDate: DateTime.now().add(
            const Duration(days: 30),
          ),
        );
        if (dateTime != null) {
          getIt
              .get<InvoicesControllerCubit>()
              .changedBillToClientCreateAt(dateTime);
        }
      },
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: context.colors.backgroundSecondary,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: context.colors.backgroundSecondary,
            width: 0.5,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            state.currentInvoice.createdAt?.formatddMMMyyyy ?? '',
            style: AppTextStyles.body1,
          ),
        ),
      ),
    );
  }
}

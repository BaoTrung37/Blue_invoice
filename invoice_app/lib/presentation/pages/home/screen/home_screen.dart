import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/pages/home/cubit/invoice_controller_cubit.dart';
import 'package:invoice_app/presentation/resources/app_colors.dart';
import 'package:invoice_app/presentation/resources/app_text_styles.dart';

import '../widgets/invoice_item.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // getIt.get<IsarDatabase>().importJson();

    getIt.get<InvoiceControllerCubit>().initData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<InvoiceControllerCubit>(),
      child: Scaffold(
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
      ),
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
            BlocBuilder<InvoiceControllerCubit, InvoiceControllerState>(
              builder: (context, state) {
                if (state.invoices.isNotEmpty) {
                  return Text(
                      'There are ${state.invoices.length} total invoices');
                } else {
                  return const Text('No Invoices');
                }
              },
            ),
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
    return BlocBuilder<InvoiceControllerCubit, InvoiceControllerState>(
      builder: (context, state) {
        if (state.invoices.isNotEmpty) {
          return _buildInvoiceList(state);
        } else {
          return _buildEmptyInvoiceList();
        }
      },
    );
  }

  Widget _buildInvoiceList(InvoiceControllerState state) {
    final invoices = state.invoices;
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InvoiceItem(
            invoice: invoices[index],
          );
        },
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemCount: invoices.length,
      ),
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

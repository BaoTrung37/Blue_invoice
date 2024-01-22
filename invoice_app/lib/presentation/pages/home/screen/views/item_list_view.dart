import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/presentation/pages/home/cubit/invoices_controller_cubit.dart';
import 'package:invoice_app/presentation/pages/home/widgets/custom_button.dart';
import 'package:invoice_app/presentation/resources/resources.dart';

import '../../../../presentation.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Item List', style: AppTextStyles.h2),
        16.verticalSpace,
        _buildHeadingTable(),
        8.verticalSpace,
        BlocBuilder<InvoicesControllerCubit, InvoicesControllerState>(
          bloc: getIt.get<InvoicesControllerCubit>(),
          buildWhen: (previous, current) =>
              previous.currentInvoice.items != current.currentInvoice.items,
          builder: (context, state) {
            final items = state.currentInvoice.items;
            print(items);
            return ListView.separated(
              key: UniqueKey(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = items[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: AppTextField(
                        initialText: item.name,
                        onFinishTextChanged: (value) {
                          getIt.get<InvoicesControllerCubit>().updateItemName(
                                index: index,
                                itemName: value!,
                              );
                        },
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      flex: 2,
                      child: AppTextField(
                        initialText: (item.quantity ?? '').toString(),
                        keyboardType: TextInputType.number,
                        onFinishTextChanged: (value) {
                          getIt
                              .get<InvoicesControllerCubit>()
                              .updateItemQuantity(
                                index: index,
                                quantityStr: value!,
                              );
                        },
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      flex: 3,
                      child: AppTextField(
                        initialText: (item.price ?? '').toString(),
                        keyboardType: TextInputType.number,
                        onFinishTextChanged: (value) {
                          getIt.get<InvoicesControllerCubit>().updateItemPrice(
                                index: index,
                                priceStr: value!,
                              );
                        },
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      flex: 3,
                      child: AppTextField(
                        isReadOnly: true,
                        initialText: (item.total ?? '').toString(),
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            getIt
                                .get<InvoicesControllerCubit>()
                                .removeItem(index);
                          },
                          child: Assets.icons.iconDelete.svg(),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: items.length,
              separatorBuilder: (context, index) => 16.verticalSpace,
            );
          },
        ),
        24.verticalSpace,
        CustomButton(
          onTap: () {
            getIt.get<InvoicesControllerCubit>().addNewItem();
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

  Widget _buildHeadingTable() {
    return Row(
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
    );
  }
}

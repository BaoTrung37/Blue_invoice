import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/presentation/resources/resources.dart';

@RoutePage()
class InvoiceDetailScreen extends StatelessWidget {
  const InvoiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      appBar: AppBar(
        leading: Center(
          child: Assets.icons.iconArrowLeft.svg(
            height: 20.h,
          ),
        ),
        backgroundColor: context.colors.backgroundPrimary,
        title: const Text('Go back'),
      ),
      body: const SafeArea(
        child: Text('Invoice Detail'),
      ),
    );
  }
}

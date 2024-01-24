import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/presentation.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    required this.child,
    required this.status,
    this.errorView,
    super.key,
  });

  final Widget child;
  final Widget? errorView;
  final LoadingStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadingStatus.success:
        return child;
      case LoadingStatus.initial:
      case LoadingStatus.process:
        return const AppLoadingIndicator();
      case LoadingStatus.error:
        return errorView ?? Container();
    }
  }
}

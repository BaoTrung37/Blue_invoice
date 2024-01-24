import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/widgets/app_indicator/app_loading_indicator.dart';

import '../enums/loading_status.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    required this.child,
    required this.status,
    super.key,
  });

  final Widget child;
  final LoadingStatus status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: status == LoadingStatus.process,
          child: child,
        ),
        Positioned.fill(
          child: Visibility(
            visible: status == LoadingStatus.process,
            child: const AppLoadingIndicator(),
          ),
        ),
      ],
    );
  }
}

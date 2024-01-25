import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/widgets/dialog/app_dialog.dart';

Future<bool?> showConfirmDialog(
  BuildContext context, {
  String? title,
  String? content,
  String? confirmButtonTitle,
  String? cancelButtonTitle,
  VoidCallback? onConfirmButtonTap,
}) {
  return showAppDialog(
    context,
    title: title,
    content: content,
    actions: [
      ActionAppDialog(
        actionDialogTitle: confirmButtonTitle ?? 'Yes',
        onAction: (context) {
          onConfirmButtonTap?.call();
          // if (onConfirmButtonTap == null) {
          Navigator.of(context).pop(true);
          // }
        },
      ),
      ActionAppDialog(
        actionDialogTitle: cancelButtonTitle ?? 'Cancel',
        onAction: (context) {
          Navigator.of(context).pop(false);
        },
      ),
    ],
  );
}

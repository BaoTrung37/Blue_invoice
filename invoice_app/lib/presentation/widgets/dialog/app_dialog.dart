import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/resources/app_colors.dart';
import 'package:invoice_app/presentation/resources/app_text_styles.dart';

Future<T?> showAppDialog<T>(
  BuildContext context, {
  String? title,
  String? content,
  required List<ActionAppDialog> actions,
  Widget? child,
  bool useRootNavigator = true,
}) async {
  return showDialog<T>(
    barrierDismissible: false,
    useRootNavigator: useRootNavigator,
    context: context,
    builder: (BuildContext context) {
      return _AppDiaLog(
        title: title,
        content: content,
        actions: actions,
      );
    },
  );
}

class _AppDiaLog extends StatelessWidget {
  const _AppDiaLog({
    this.title,
    this.content,
    required this.actions,
  });

  final String? title;
  final String? content;
  final List<ActionAppDialog> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.backgroundPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitle(),
                  if (title != null && content != null)
                    const SizedBox(
                      height: 16,
                    ),
                  _buildContent(),
                ],
              ),
            ),
            ...actions
                .map(
                  (ActionAppDialog e) => GestureDetector(
                    onTap: () {
                      e.onAction.call(context);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color(0xFF42424D),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Text(
                        e.actionDialogTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h3.copyWith(
                          height: 3,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return title != null
        ? Text(
            title!,
            textAlign: TextAlign.center,
            style: AppTextStyles.h2,
          )
        : const SizedBox.shrink();
  }

  Widget _buildContent() {
    return content != null
        ? Text(
            content!,
            textAlign: TextAlign.center,
            style: AppTextStyles.hs3,
          )
        : const SizedBox.shrink();
  }
}

class ActionAppDialog {
  ActionAppDialog({
    required this.actionDialogTitle,
    required this.onAction,
    this.isDefaultAction = false,
  });

  final String actionDialogTitle;
  final Function(BuildContext) onAction;
  final bool isDefaultAction;
}

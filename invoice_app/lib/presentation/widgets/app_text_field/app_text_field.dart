// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/presentation/resources/app_colors.dart';
import 'package:invoice_app/presentation/resources/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.focusNode,
    this.controller,
    this.initialText,
    this.textFieldKey,
    this.validator,
    this.onTextChange,
    this.onSubmit,
    this.onFinishTextChanged,
    this.keyboardType,
    this.textInputAction,
    this.title,
    this.height,
    this.width,
    this.isAutoDisposeController = true,
    this.isReadOnly = false,
  }) : super(key: key);

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? initialText;
  final GlobalKey<FormFieldState>? textFieldKey;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onTextChange;
  final ValueChanged<String?>? onSubmit;
  final ValueChanged<String?>? onFinishTextChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? title;
  final double? height;
  final double? width;

  final bool isAutoDisposeController;
  final bool isReadOnly;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _textController;
  late final GlobalKey<FormFieldState> _textFieldKey;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textController =
        widget.controller ?? TextEditingController(text: widget.initialText);

    _focusNode = widget.focusNode ?? FocusNode();
    _textFieldKey = widget.textFieldKey ?? GlobalKey<FormFieldState>();
  }

  @override
  void dispose() {
    if (widget.isAutoDisposeController) {
      _textController.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: AppTextStyles.h3,
          ),
          8.verticalSpace,
        ],
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: context.colors.backgroundSecondary,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Focus(
            onFocusChange: (focus) {
              if (!focus) {
                widget.onFinishTextChanged?.call(_textController.text);
              }
            },
            child: TextFormField(
              key: _textFieldKey,
              onChanged: (value) {
                widget.onTextChange?.call(value);
              },
              readOnly: widget.isReadOnly,
              controller: _textController,
              onFieldSubmitted: widget.onSubmit,
              validator: widget.validator,
              focusNode: _focusNode,
              textInputAction: widget.textInputAction,
              keyboardType: widget.keyboardType,
              style: AppTextStyles.body1,
              decoration: InputDecoration(
                fillColor: context.colors.backgroundPrimary,
                filled: widget.isReadOnly,
                contentPadding: widget.isReadOnly
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 12.w,
                      ),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isReadOnly
                        ? context.colors.backgroundPrimary
                        : context.colors.backgroundSecondary,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isReadOnly
                        ? context.colors.backgroundPrimary
                        : context.colors.backgroundSecondary,
                    width: 0.5,
                  ),
                ),
                errorBorder: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

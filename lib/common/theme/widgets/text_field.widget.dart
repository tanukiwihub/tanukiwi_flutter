import 'package:flutter/material.dart';
import 'package:tanukiwi/common/theme/theme.widget.dart';

class TKXDtextField extends StatelessWidget {
  final bool autofocus;
  final TextEditingController? controller;
  final bool expands;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  const TKXDtextField(
      {Key? key,
      this.autofocus = false,
      this.controller,
      this.expands = false,
      this.focusNode,
      this.maxLines = 1,
      this.minLines,
      this.onChanged,
      this.placeholder,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    return TextField(
      autofocus: autofocus,
      controller: controller,
      cursorColor: theme.cursorColor,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      style: theme.text.body,
      keyboardAppearance: theme.brightness,
      onChanged: onChanged,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      decoration: InputDecoration(
        hintText: placeholder,
        isCollapsed: true,
        border: InputBorder.none,
        contentPadding: contentPadding,
      ),
    );
  }
}

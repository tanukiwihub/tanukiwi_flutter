import 'package:flutter/widgets.dart';

import '../theme.widget.dart';

class TKXDtextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? autofocus;
  final Widget? suffixIcon;
  final String? placeholder;

  const TKXDtextFieldWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.suffixIcon,
    this.autofocus,
    this.placeholder,
  }) : super(key: key);

  @override
  State<TKXDtextFieldWidget> createState() => _TKXDtextFieldWidgetState();
}

class _TKXDtextFieldWidgetState extends State<TKXDtextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    bool autofocus = widget.autofocus ?? false;
    bool showPlaceholder = widget.controller.text.isEmpty ? true : false;
    String placeholder = widget.placeholder ?? "";

    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                top: 2,
                left: -1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    showPlaceholder ? placeholder : "",
                    style: TKXDtheme.of(context).defaultTextStyle.copyWith(
                          color: TKXDtheme.of(context).color.labelSecondary,
                        ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => widget.focusNode.requestFocus(),
                behavior: HitTestBehavior.translucent,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: EditableText(
                    keyboardAppearance: TKXDtheme.of(context).brightness,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    controller: widget.controller,
                    onChanged: (value) {
                      setState(() {
                        showPlaceholder = value.isNotEmpty;
                      });
                    },
                    focusNode: widget.focusNode,
                    backgroundCursorColor: TKXDtheme.of(context).cursorColor,
                    cursorColor: TKXDtheme.of(context).cursorColor,
                    style: TKXDtheme.of(context).defaultTextStyle,
                    autofocus: autofocus,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: widget.suffixIcon,
        )
      ],
    );
  }
}

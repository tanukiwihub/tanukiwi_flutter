import 'package:flutter/material.dart';

import '../../../../common/theme/theme.widget.dart';
import '../../../../common/theme/widgets/button.widget.dart';
import '../controllers/converter.controller.dart';
import '../controllers/converter.state.dart';

class ConverterInitialPasteButtonWidget extends StatefulWidget {
  const ConverterInitialPasteButtonWidget({
    Key? key,
    required this.state,
    required this.notifier,
  }) : super(key: key);

  final ConverterInitial state;
  final ConverterPageController notifier;

  @override
  State<ConverterInitialPasteButtonWidget> createState() =>
      _ConverterInitialPasteButtonWidgetState();
}

class _ConverterInitialPasteButtonWidgetState
    extends State<ConverterInitialPasteButtonWidget>
    with WidgetsBindingObserver {
  bool isVisible = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {}
    widget.notifier.hasClipboardString().then((value) {
      setState(() {
        isVisible = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    widget.notifier.hasClipboardString().then((value) {
      setState(() {
        isVisible = value;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    return Visibility(
      visible: isVisible,
      child: TKXDoutlineButton(
        onPressed: widget.notifier.onPasteTap,
        color: theme.color.highlightBlue,
        child: const Text('Paste'),
      ),
    );
    ;
  }
}

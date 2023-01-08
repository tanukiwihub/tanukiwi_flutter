import 'package:flutter/material.dart';

import '../../../../common/theme/theme.widget.dart';
import '../controllers/converter.controller.dart';
import '../controllers/converter.state.dart';

class ConverterInitialWidget extends StatelessWidget {
  const ConverterInitialWidget({
    Key? key,
    required this.state,
    required this.notifier,
  }) : super(key: key);

  final ConverterInitial state;
  final ConverterPageController notifier;

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    return FutureBuilder<bool>(
      future: state.hasClipboardString,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return Visibility(
          visible: snapshot.data ?? false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: theme.pagePaddingX,
            ),
            child: OutlinedButton(
              onPressed: notifier.onPasteTap,
              child: const Text('Paste'),
            ),
          ),
        );
      },
    );
  }
}

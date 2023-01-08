import 'package:flutter/material.dart';

import '../../../../common/theme/theme.widget.dart';
import '../../../../common/theme/widgets/scrollbar.widget.dart';
import '../controllers/converter.state.dart';

class ConverterLoadedWidget extends StatelessWidget {
  const ConverterLoadedWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ConverterLoaded state;

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    List<Widget> tokens = [];
    for (var token in state.morphTokens) {
      Widget tokenWidget = Column(
        children: [
          Text(
            token.phoneticRomaji,
            style: theme.text.caption1.copyWith(
              color: theme.color.labelSecondary,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            token.origin,
            style: theme.text.body.copyWith(
              height: 1,
            ),
          ),
        ],
      );

      tokens.add(tokenWidget);
    }

    return Flexible(
      child: TKXDscrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              theme.pagePaddingX,
              theme.space(1.0),
              theme.pagePaddingX,
              theme.space(.5),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                runSpacing: 16.0,
                spacing: 16.0,
                children: tokens,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

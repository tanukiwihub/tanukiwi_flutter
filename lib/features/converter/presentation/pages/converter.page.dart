import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/theme.widget.dart';
import '../../../../common/theme/widgets/appBar.widget.dart';
import '../../../../common/theme/widgets/divider.widget.dart';
import '../../../../common/theme/widgets/iconButton.widget.dart';
import '../../../../common/theme/widgets/text_field.widget.dart';
import '../controllers/converter.controller.dart';
import '../controllers/converter.state.dart';
import '../widgets/converter_initial_paste_button.widget.dart';
import '../widgets/converter_loaded.widget.dart';

class ConverterPage extends ConsumerWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(converterPageControllerProvider);
    final notifier = ref.watch(converterPageControllerProvider.notifier);
    final theme = TKXDtheme.of(context);

    const double inputHeight = 160.0;

    List<Widget> buildInputStackChildren() {
      List<Widget> children = [];

      children.add(
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: theme.pagePaddingX,
              right: theme.space(.25) + theme.iconButtonWidth,
            ),
            child: TKXDtextField(
              focusNode: notifier.inputFocusNode,
              controller: notifier.inputController,
              maxLines: null,
              placeholder: 'Type or paste Japanese text',
              contentPadding: EdgeInsets.symmetric(
                vertical: theme.space(.5),
              ),
            ),
          ),
        ),
      );

      if (state is! ConverterInitial) {
        children.add(
          Positioned(
            top: 0,
            right: 0,
            child: TKXDiconButtonWidget(
              onPressed: () => notifier.onInputClearTap(context),
              icon: const Icon(Icons.close),
            ),
          ),
        );
      }

      if (state is ConverterInitial) {
        children.add(
          Positioned(
            bottom: theme.space(1.0),
            left: theme.pagePaddingX,
            child: ConverterInitialPasteButtonWidget(
              state: state,
              notifier: notifier,
            ),
          ),
        );
      }

      return children;
    }

    Widget buildOutputChild() {
      if (state is ConverterLoaded) {
        return ConverterLoadedWidget(
          state: state,
        );
      } else {
        return Container();
      }
    }

    return Scaffold(
      appBar: TKXDappBar(
        parentContext: context,
        title: const Text('Converter'),
      ),
      body: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              notifier.onInputSizedBoxTap();
            },
            child: SizedBox(
              height: inputHeight,
              child: Stack(
                children: buildInputStackChildren(),
              ),
            ),
          ),
          const TKXDdivider(),
          Expanded(
            child: buildOutputChild(),
          ),
        ].toList(),
      ),
    );
  }
}

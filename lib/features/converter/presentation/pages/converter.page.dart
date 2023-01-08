import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/theme.widget.dart';
import '../../../../common/theme/widgets/appBar.widget.dart';
import '../../../../common/theme/widgets/divider.widget.dart';
import '../../../../common/theme/widgets/iconButton.widget.dart';
import '../../../../common/theme/widgets/text_field.widget.dart';
import '../controllers/converter.controller.dart';
import '../controllers/converter.state.dart';
import '../widgets/converter_initial.widget.dart';
import '../widgets/converter_loaded.widget.dart';

class ConverterPage extends ConsumerWidget with WidgetsBindingObserver {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(converterPageControllerProvider);
    final notifier = ref.watch(converterPageControllerProvider.notifier);
    final theme = TKXDtheme.of(context);

    final inputFlex = state is ConverterLoaded ? 0 : 1;
    final inputContraints = state is ConverterLoaded
        ? const BoxConstraints(
            maxHeight: 160.0,
            minHeight: 160.0,
          )
        : const BoxConstraints();

    Widget createBody() {
      if (state is ConverterInitial) {
        return ConverterInitialWidget(
          state: state,
          notifier: notifier,
        );
      } else if (state is ConverterLoaded) {
        return ConverterLoadedWidget(
          state: state,
        );
      } else {
        return const Text('error');
      }
    }

    return Scaffold(
      appBar: TKXDappBar(
        parentContext: context,
        title: const Text('Converter'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: inputFlex,
            child: ConstrainedBox(
              constraints: inputContraints,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.pagePaddingX,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TKXDtextField(
                        controller: notifier.inputController,
                        maxLines: null,
                        expands: true,
                        placeholder: 'Type or paste Japanese text',
                      ),
                    ),
                    Visibility(
                      child: TKXDiconButtonWidget(
                        onPressed: () {
                          notifier.onInputClearTap();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const TKXDdivider(),
          createBody(),
        ],
      ),
    );
  }
}

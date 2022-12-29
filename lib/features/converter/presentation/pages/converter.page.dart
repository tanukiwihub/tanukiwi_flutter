import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/widgets/appBar.widget.dart';
import '../../../../common/theme/widgets/text_field.widget.dart';
import '../controllers/converter.controller.dart';
import '../controllers/converter.state.dart';

class ConverterPage extends ConsumerWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(converterPageControllerProvider);

    Widget createBody() {
      if (state is ConverterInitial) {
        return const Text('initial');
      } else if (state is ConverterLoaded) {
        return const Text('loaded');
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
          const Expanded(
            child: TKXDtextField(
              maxLines: null,
              expands: true,
              placeholder: 'Type or paste Japanese text',
            ),
          ),
          createBody(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanukiwi/features/dict/presentation/controllers/dict.controller.dart';

import '../../../../common/theme/theme.widget.dart';
import '../widgets/searchField.widget.dart';

class DictPage extends ConsumerWidget {
  const DictPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(dictPageControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                TKXDtheme.of(context).pagePaddingX,
                TKXDtheme.of(context).space(1.0),
                TKXDtheme.of(context).pagePaddingX,
                0,
              ),
              child: SearchFieldWidget(
                onTap: () => notifier.onSearchFieldTap(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

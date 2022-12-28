import 'package:flutter/material.dart';

import '../../../../common/theme/widgets/appBar.widget.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TKXDappBar(
        parentContext: context,
        title: const Text('converter'),
      ),
      body: const Text('hi'),
    );
  }
}

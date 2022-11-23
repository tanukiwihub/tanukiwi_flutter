import 'package:flutter/material.dart';

import '../../../../common/theme/theme.widget.dart';
import '../widgets/searchField.widget.dart';

class SearchMainPage extends StatelessWidget {
  const SearchMainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
                child: const SearchFieldWidget(),
              ),
            ],
          ),
        ),
      );
}

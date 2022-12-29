import 'package:flutter/material.dart';

import '../../../../common/theme/theme.widget.dart';
import '../../../../common/theme/widgets/iconButton.widget.dart';
import '../../../../common/theme/widgets/text_field.widget.dart';
import '../controllers/search.controller.dart';

class SearchPageTextField extends StatefulWidget {
  final SearchPageController searchPageController;

  const SearchPageTextField({
    Key? key,
    required this.searchPageController,
  }) : super(key: key);

  @override
  State<SearchPageTextField> createState() => _SearchPageTextFieldState();
}

class _SearchPageTextFieldState extends State<SearchPageTextField> {
  bool hasText = false;

  @override
  Widget build(BuildContext context) {
    final theme = TKXDtheme.of(context);

    return Row(
      children: [
        Expanded(
          child: TKXDtextField(
            placeholder: 'Search',
            autofocus: true,
            controller: widget.searchPageController.searchFieldController,
            focusNode: widget.searchPageController.searchFieldFocus,
            onChanged: (value) {
              setState(() {
                hasText = value != '' ? true : false;
              });
            },
          ),
        ),
        Opacity(
          opacity: hasText ? 1 : 0,
          child: Padding(
            padding: EdgeInsets.only(
              left: theme.space(.25),
            ),
            child: TKXDiconButtonWidget(
              onPressed: () {
                setState(() {
                  hasText = false;
                });
                widget.searchPageController.clearSearch();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../common/theme/widgets/iconButton.widget.dart';
import '../../../../common/theme/widgets/textField.widget.dart';
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
    return TKXDtextFieldWidget(
      placeholder: 'Search',
      autofocus: true,
      controller: widget.searchPageController.searchFieldController,
      focusNode: widget.searchPageController.searchFieldFocus,
      onChanged: (value) {
        setState(() {
          hasText = value != '' ? true : false;
        });
      },
      suffixIcon: hasText
          ? TKXDiconButtonWidget(
              onPressed: () {
                setState(() {
                  hasText = false;
                });
                widget.searchPageController.clearSearch();
              },
              icon: const Icon(Icons.close),
            )
          : null,
    );
  }
}

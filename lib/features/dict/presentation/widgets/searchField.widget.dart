import 'package:flutter/material.dart';

import '../../../../common/theme/theme.widget.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: TKXDtheme.of(context).color.fillSecondary,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: TKXDtheme.of(context).color.labelSecondary,
            ),
          ),
          Text(
            'Search',
            style: TKXDtheme.of(context).text.body.copyWith(
                  color: TKXDtheme.of(context).color.labelSecondary,
                ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../common/theme/theme.widget.dart';

class SearchFieldWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SearchFieldWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: TKXDtheme.of(context).color.fillSecondary,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: TKXDtheme.of(context).touchHeight,
              width: TKXDtheme.of(context).touchHeight,
              child: Icon(
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
      ),
    );
  }
}

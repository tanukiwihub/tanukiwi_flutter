import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tanukiwi/features/dict/presentation/pages/kanji.page.dart';

import 'features/converter/presentation/pages/converter.page.dart';
import 'features/dict/presentation/pages/dict.page.dart';
import 'features/dict/presentation/pages/search.page.dart';

class DictLocation extends BeamLocation<BeamState> {
  DictLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/dict/search/:kanjiId/:kanjiLiteral',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> beamPages = [];

    if (state.pathPatternSegments.contains('dict')) {
      beamPages.add(
        const BeamPage(
          key: ValueKey('dict'),
          type: BeamPageType.noTransition,
          child: DictPage(),
        ),
      );
    }

    if (state.uri.pathSegments.contains('search')) {
      beamPages.add(
        const BeamPage(
          key: ValueKey('dict/search'),
          type: BeamPageType.noTransition,
          child: SearchPage(),
        ),
      );
    }

    if (state.pathParameters.containsKey('kanjiLiteral')) {
      final kanjiId = state.pathParameters['kanjiId']!;
      final kanjiLiteral = state.pathParameters['kanjiLiteral']!;

      beamPages.add(
        BeamPage(
          key: ValueKey('kanji-$kanjiId'),
          child: KanjiPage(
            kanjiId: int.parse(kanjiId),
            kanjiLiteral: kanjiLiteral,
          ),
        ),
      );
    }

    return beamPages;
  }
}

class ConverterLocation extends BeamLocation<BeamState> {
  ConverterLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        '/converter',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> beamPages = [];

    if (state.pathPatternSegments.contains('converter')) {
      beamPages.add(
        const BeamPage(
          key: ValueKey('converter'),
          type: BeamPageType.noTransition,
          child: ConverterPage(),
        ),
      );
    }

    return beamPages;
  }
}

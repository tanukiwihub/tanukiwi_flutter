import 'package:beamer/beamer.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "common/theme/materialTheme.data.dart";
import "common/theme/theme.widget.dart";
import "common/utils/database.util.dart";
import 'app.screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databaseUtil = DatabaseUtil();
  await databaseUtil.init();

  runApp(
    ProviderScope(
      overrides: [
        databaseUtilProvider.overrideWithValue(databaseUtil),
      ],
      child: TKXDtheme(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
    initialPath: '/dict',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (context, state, data) => const AppScreen(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Flutter Demo",
      theme: getTKXDmaterialTheme(context),
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
    );
  }

  /*
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: "/",
          builder: (context, state) {
            return const DictPage();
          },
          routes: <GoRoute>[
            GoRoute(
              path: "search",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const SearchPage(),
                );
              },
            ),
            GoRoute(
              name: "kanji",
              path: "kanji/:id/:literal",
              builder: (context, state) => KanjiPage(
                kanjiId: int.parse(
                  state.params["id"]!,
                ),
                kanjiLiteral: state.params["literal"]!,
              ),
            ),
          ]),
    ],
  );
  */
}

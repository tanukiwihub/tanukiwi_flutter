import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'common/theme/materialTheme.data.dart';
import 'common/theme/theme.widget.dart';
import 'common/utils/database.util.dart';
import 'features/dict/presentation/pages/kanji.page.dart';
import 'features/dict/presentation/pages/searchMain.page.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: getTKXDmaterialTheme(context),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchMainPage();
          },
          routes: <GoRoute>[
            GoRoute(
              name: 'kanji',
              path: "kanji/:id/:literal",
              builder: (BuildContext context, GoRouterState state) => KanjiPage(
                kanjiId: int.parse(
                  state.params["id"]!,
                ),
                kanjiLiteral: state.params["literal"]!,
              ),
            ),
          ]),
    ],
  );
}

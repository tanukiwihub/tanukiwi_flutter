import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'common/utils/database.util.dart';
import 'features/dict/presentation/pages/kanji.page.dart';
import 'features/dict/presentation/pages/search.page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databaseUtil = DatabaseUtil();
  await databaseUtil.init();

  runApp(
    ProviderScope(
      overrides: [
        databaseUtilProvider.overrideWithValue(databaseUtil),
      ],
      child: MyApp(),
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
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SearchPage();
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

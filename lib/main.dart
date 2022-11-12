import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/utils/database.util.dart';
import 'features/dict/presentation/screens/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databaseUtil = DatabaseUtil();
  await databaseUtil.init();

  runApp(
    ProviderScope(
      overrides: [
        databaseUtilProvider.overrideWithValue(databaseUtil),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const DictPage(),
    );
  }
}

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'locations.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late int currentIndex;

  final routerDelegates = [
    BeamerDelegate(
      initialPath: '/dict',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('dict')) {
          return DictLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/converter',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('converter')) {
          return ConverterLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    currentIndex = uriString.contains('dict') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: [
            Beamer(
              routerDelegate: routerDelegates[0],
            ),
            Beamer(
              routerDelegate: routerDelegates[1],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Dictionary',
              icon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              label: 'Converter',
              icon: Icon(Icons.article),
            ),
          ],
          onTap: (index) {
            if (index != currentIndex) {
              setState(() => currentIndex = index);
              routerDelegates[currentIndex].update(rebuild: false);
            }
          },
        ),
      ),
    );
  }
}

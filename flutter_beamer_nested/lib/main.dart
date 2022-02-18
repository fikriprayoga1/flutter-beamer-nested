import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beamer_nested/util/beamer_location_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: BeamerDelegate(
        initialPath: '/women/maya',
        notFoundRedirectNamed: '/women/maya',
        transitionDelegate: const NoAnimationTransitionDelegate(),
        locationBuilder:
            BeamerLocationBuilder(beamLocations: [BeamerLocationHome()]),
      ),
    );
  }
}

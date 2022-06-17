import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beamer_nested/view/view_home.dart';

class BeamerLocationHome extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        title: 'Flutter Beamer Nested',
        child: Container(),
        type: BeamPageType.noTransition,
      ),
      if (state.pathParameters.containsKey('gender'))
        BeamPage(
          key: ValueKey(state.pathParameters['gender']),
          title: 'Flutter Beamer Nested',
          child: ViewHome(
            urlData: state.pathParameters['gender'],
          ),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/:gender/:name'];
}

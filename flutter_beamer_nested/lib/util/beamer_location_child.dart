import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_beamer_nested/view/view_option.dart';

class BeamerLocationChild extends BeamLocation<BeamState> {
  final String gender;

  BeamerLocationChild({required this.gender});
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        title: 'Flutter Beamer Nested',
        child: Container(),
        type: BeamPageType.noTransition,
      ),
      if (state.pathParameters.containsKey('name'))
        BeamPage(
          key: ValueKey(state.pathParameters['name']),
          title: gender,
          child: ViewOption(
            key: UniqueKey(),
            isMen: gender == 'Men',
            selectedName: state.pathParameters['name'],
          ),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/:gender/:name'];
}

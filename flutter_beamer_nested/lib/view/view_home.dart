import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beamer_nested/util/beamer_location_child.dart';
import 'package:flutter_beamer_nested/util/screen_unit.dart';
import 'package:flutter_beamer_nested/view/util/view_util_button_menu.dart';

class ViewHome extends StatefulWidget {
  final String? urlData;
  const ViewHome({
    Key? key,
    required this.urlData,
  }) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  final _beamerKey = GlobalKey<BeamerState>();
  String _title = 'Women';
  Future<bool>? _isMen;

  @override
  void initState() {
    if ((widget.urlData != null) && (widget.urlData == 'men')) {
      _title = 'Men';
      _isMen = Future.delayed(const Duration(seconds: 3), () => true);
    } else {
      _isMen = Future.delayed(const Duration(seconds: 3), () => false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUnit().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Beamer Nested'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _menu(),
        _viewOptionLayout(),
      ],
    );
  }

  Widget _viewOptionLayout() {
    return Expanded(
      child: FutureBuilder(
          future: _isMen,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            final bool? _isMen = snapshot.data;
            if (_isMen != null) {
              if (_isMen) {
                return ClipRRect(
                  child: Beamer(
                    key: _beamerKey,
                    routerDelegate: BeamerDelegate(
                      initialPath: '/men/bagas',
                      notFoundRedirectNamed: '/men/bagas',
                      transitionDelegate: const NoAnimationTransitionDelegate(),
                      locationBuilder: BeamerLocationBuilder(
                          beamLocations: [BeamerLocationChild(gender: 'Men')]),
                    ),
                  ),
                );
              }

              return ClipRRect(
                child: Beamer(
                  key: _beamerKey,
                  routerDelegate: BeamerDelegate(
                    initialPath: '/women/maya',
                    notFoundRedirectNamed: '/women/maya',
                    transitionDelegate: const NoAnimationTransitionDelegate(),
                    locationBuilder: BeamerLocationBuilder(
                        beamLocations: [BeamerLocationChild(gender: 'Women')]),
                  ),
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }

  Widget _menu() {
    return Container(
      width: ScreenUnit().width(150),
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          _placeHolder(),
          SizedBox(height: ScreenUnit().height(50)),
          ViewUtilButtonMenu(
            key: UniqueKey(),
            buttonTitle: 'Women',
            currentButtonTitle: _title,
            onTap: () {
              context.beamToNamed('/women/maya');
            },
          ),
          SizedBox(height: ScreenUnit().height(25)),
          ViewUtilButtonMenu(
            key: UniqueKey(),
            buttonTitle: 'Men',
            currentButtonTitle: _title,
            onTap: () {
              context.beamToNamed('/men/bagas');
            },
          ),
        ],
      ),
    );
  }

  Widget _placeHolder() {
    return SizedBox(
      width: double.infinity,
      height: ScreenUnit().height(300),
      child: Placeholder(
        color: Colors.grey[400]!,
      ),
    );
  }
}

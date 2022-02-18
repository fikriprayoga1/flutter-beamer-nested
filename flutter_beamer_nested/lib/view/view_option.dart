import 'package:beamer/src/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beamer_nested/view/util/view_util_button_name.dart';

class ViewOption extends StatefulWidget {
  final bool isMen;
  final String? selectedName;

  const ViewOption({
    Key? key,
    this.isMen = false,
    this.selectedName = 'Maya',
  }) : super(key: key);

  @override
  State<ViewOption> createState() => _ViewOptionState();
}

class _ViewOptionState extends State<ViewOption> {
  late String _title;
  List<String> _buttonNameList = ['Maya', 'Siska', 'Mia'];
  @override
  void initState() {
    if (widget.isMen) {
      switch (widget.selectedName) {
        case 'danu':
          _title = 'Danu';

          break;
        case 'budi':
          _title = 'Budi';

          break;
        default:
          _title = 'Bagas';
      }

      _buttonNameList = ['Bagas', 'Danu', 'Budi'];
    } else {
      switch (widget.selectedName) {
        case 'siska':
          _title = 'Siska';

          break;
        case 'mia':
          _title = 'Mia';

          break;
        default:
          _title = 'Maya';
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _titleLayout(),
        _buttonList(),
      ],
    );
  }

  Widget _titleLayout() {
    return Text(_title);
  }

  Widget _buttonList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ViewUtilButtonName(
          key: UniqueKey(),
          buttonTitle: _buttonNameList[0],
          currentButtonTitle: _title,
          onTap: () {
            if (widget.isMen) {
              context.beamToNamed('/men/bagas');
            } else {
              context.beamToNamed('/women/maya');
            }
          },
        ),
        ViewUtilButtonName(
          key: UniqueKey(),
          buttonTitle: _buttonNameList[1],
          currentButtonTitle: _title,
          onTap: () {
            if (widget.isMen) {
              context.beamToNamed('/men/danu');
            } else {
              context.beamToNamed('/women/siska');
            }
          },
        ),
        ViewUtilButtonName(
          key: UniqueKey(),
          buttonTitle: _buttonNameList[2],
          currentButtonTitle: _title,
          onTap: () {
            if (widget.isMen) {
              context.beamToNamed('/men/budi');
            } else {
              context.beamToNamed('/women/mia');
            }
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_beamer_nested/util/screen_unit.dart';

class ViewUtilButtonMenu extends StatefulWidget {
  final String buttonTitle;
  final String currentButtonTitle;
  final Function() onTap;

  const ViewUtilButtonMenu({
    Key? key,
    required this.buttonTitle,
    required this.currentButtonTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  _ViewUtilButtonMenuState createState() => _ViewUtilButtonMenuState();
}

class _ViewUtilButtonMenuState extends State<ViewUtilButtonMenu> {
  Color _buttonColor = Colors.white;

  @override
  void initState() {
    if (widget.buttonTitle == widget.currentButtonTitle) {
      _buttonColor = Colors.green;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHover) {
        if (widget.buttonTitle != widget.currentButtonTitle) {
          if (isHover) {
            _buttonColor = Colors.grey[200]!;
          } else {
            _buttonColor = Colors.white;
          }
          setState(() {});
        }
      },
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: ScreenUnit().height(100),
        color: _buttonColor,
        padding: EdgeInsets.only(
          left: ScreenUnit().width(30),
          right: ScreenUnit().width(10),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(widget.buttonTitle),
        ),
      ),
    );
  }
}

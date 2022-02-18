import 'package:flutter/material.dart';
import 'package:flutter_beamer_nested/util/screen_unit.dart';

class ViewUtilButtonName extends StatefulWidget {
  final String buttonTitle;
  final String currentButtonTitle;
  final Function() onTap;

  const ViewUtilButtonName({
    Key? key,
    required this.buttonTitle,
    required this.currentButtonTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  _ViewUtilButtonNameState createState() => _ViewUtilButtonNameState();
}

class _ViewUtilButtonNameState extends State<ViewUtilButtonName> {
  Color _buttonColor = Colors.grey[200]!;

  @override
  void initState() {
    if (widget.buttonTitle == widget.currentButtonTitle) {
      _buttonColor = Colors.amber;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHover) {
        if (widget.buttonTitle != widget.currentButtonTitle) {
          if (isHover) {
            _buttonColor = Colors.amber[200]!;
          } else {
            _buttonColor = Colors.grey[200]!;
          }
          setState(() {});
        }
      },
      onTap: widget.onTap,
      child: Container(
        width: ScreenUnit().width(150),
        height: ScreenUnit().height(100),
        decoration: BoxDecoration(
          color: _buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(widget.buttonTitle),
        ),
      ),
    );
  }
}

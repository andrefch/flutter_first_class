import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final String _text;
  final VoidCallback _onPressed;

  ColoredButton({@required String text, @required VoidCallback onPressed})
      : _text = text,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: _onPressed,
      child: Text(
        _text,
      ),
    );
  }
}

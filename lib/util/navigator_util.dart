import 'package:flutter/material.dart';

Future<T> pushScreen<T extends Object>(BuildContext context, Widget screen) {
  final route = MaterialPageRoute<T>(builder: (context) => screen);
  return Navigator.push(context, route);
}

bool popScreen<T extends Object>(BuildContext context, [T result]) {
  return Navigator.pop(context, result);
}
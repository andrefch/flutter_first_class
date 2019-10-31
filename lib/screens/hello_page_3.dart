import 'package:class_01/util/navigator_util.dart';
import 'package:class_01/widgets/colored_button.dart';
import 'package:flutter/material.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 3"),
        centerTitle: false,
      ),
      body: Center(
        child: ColoredButton(
          text: "Voltar",
          onPressed: () => popScreen(context, "Voltou da página 3"),
        ),
      ),
    );
  }
}

import 'package:class_01/util/navigator_util.dart';
import 'package:class_01/widgets/colored_button.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 2"),
        centerTitle: false,
      ),
      body: Center(
        child: ColoredButton(
          text: "Voltar",
          onPressed: () => popScreen(context, "Voltou da página 2"),
        ),
      ),
    );
  }
}

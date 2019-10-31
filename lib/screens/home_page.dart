import 'package:class_01/util/navigator_util.dart';
import 'package:class_01/widgets/colored_button.dart';
import 'package:flutter/material.dart';

import 'hello_page_1.dart';
import 'hello_page_2.dart';
import 'hello_page_3.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _message = "Hello World";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Class"),
        centerTitle: false,
      ),
      body: _createBody(context),
      drawer: Container(
        color: Colors.yellow,
      ),
    );
  }

  Widget _createBody(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _createPageView(),
            _createText(context),
            _createButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _createButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        top: 8.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ColoredButton(
                text: "Page 1",
                onPressed: () => _onClickedPage(HelloPage1()),
              ),
              ColoredButton(
                text: "Page 2",
                onPressed: () => _onClickedPage(HelloPage2()),
              ),
              ColoredButton(
                text: "Page 3",
                onPressed: () => _onClickedPage(HelloPage3()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ColoredButton(
                text: "Snack",
                onPressed: _showSnack,
              ),
              ColoredButton(
                text: "Dialog",
                onPressed: _showDialog,
              ),
              ColoredButton(
                text: "Toast",
                onPressed: _showToast,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onClickedPage(Widget page) async {
    String text = await pushScreen(context, page);
    _updateHelloWorldMessage(text);
  }

  void _updateHelloWorldMessage(String message) {
    setState(() {
      this._message = message ?? "Hello World";
    });
  }

  void _showSnack() {

  }

  void _showDialog() {

  }

  void _showToast() {

  }

  Widget _createPageView() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      height: 300,
      child: PageView(
        children: <Widget>[
          _createImage("assets/images/dog1.png"),
          _createImage("assets/images/dog2.png"),
          _createImage("assets/images/dog3.png"),
          _createImage("assets/images/dog4.png"),
          _createImage("assets/images/dog5.png"),
        ],
      ),
    );
  }

  Widget _createText(BuildContext context) {
    return Text(
      _message,
      style: TextStyle(
        fontSize: 30.0,
        color: Theme
            .of(context)
            .primaryColor,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.combine([
          TextDecoration.overline,
          TextDecoration.underline,
        ]),
        decorationColor: Colors.amberAccent,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  Widget _createImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}

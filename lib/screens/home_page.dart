import 'package:class_01/util/navigator_util.dart';
import 'package:class_01/widgets/colored_button.dart';
import 'package:class_01/widgets/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("First Class"),
          centerTitle: false,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "CÃES",
                icon: Icon(Icons.pets),
              ),
              Tab(
                text: "ALL INCLUSIVE",
                icon: Icon(Icons.all_inclusive),
              ),
              Tab(
                text: "STREET VIEW",
                icon: Icon(Icons.streetview),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _createBody(context),
            Container(
              color: Colors.lightGreen,
            ),
            Container(
              color: Colors.amber,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _onClickFab,
        ),
        drawer: DrawerList(),
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
            _createButtons(),
          ],
        ),
      ),
    );
  }

  Widget _createButtons() {
    return Builder(
      builder: (BuildContext context) {
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
                    onPressed: () => _showSnack(context),
                  ),
                  ColoredButton(
                    text: "Dialog",
                    onPressed: () => _showDialog(context),
                  ),
                  ColoredButton(
                    text: "Toast",
                    onPressed: () => _showToast(context),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _onClickFab() {}

  void _onClickedPage(Widget page) async {
    String text = await pushScreen(context, page);
    _updateHelloWorldMessage(text);
  }

  void _updateHelloWorldMessage(String message) {
    setState(() {
      this._message = message ?? "Hello World";
    });
  }

  void _showSnack(BuildContext context) {
    _showSnackBarMessage(
      context,
      Text("Se liga na SnackBar do cachorrão da Emive!"),
      SnackBarAction(
        label: "ATIVAR",
        textColor: Colors.yellow,
        onPressed: () {
          _showSnackBarMessage(
            context,
            Text("Algo foi ativado! 🤨"),
          );
        },
      ),
    );
  }

  void _showSnackBarMessage(BuildContext context, Widget content,
      [SnackBarAction action]) {
    final snackBar = SnackBar(
      content: content,
      action: action,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Dialog do cachorrão"),
            content:
                Text("Essa é uma mensagem do cachorrão da Emive para você!!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  popScreen(context);
                },
              ),
              FlatButton(
                child: Text("Adorei!"),
                onPressed: () {
                  popScreen(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Também tem o Toast do cachorrão!! 🐶",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIos: 4,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black38,
    );
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
        color: Theme.of(context).primaryColor,
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

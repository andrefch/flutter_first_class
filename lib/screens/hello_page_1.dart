import 'package:class_01/model/dog.dart';
import 'package:class_01/screens/dog_detail.dart';
import 'package:class_01/util/navigator_util.dart';
import 'package:flutter/material.dart';

class HelloPage1 extends StatefulWidget {
  @override
  _HelloPage1State createState() => _HelloPage1State();
}

class _HelloPage1State extends State<HelloPage1> with SingleTickerProviderStateMixin {
  bool _shouldShowGridView = false;
  AnimationController _viewTypeIconAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 1"),
        centerTitle: false,
        actions: <Widget>[
          _createViewTypeAppBarButton(),
        ],
      ),
      body: _createBody(),
    );
  }


  @override
  void initState() {
    super.initState();
    _viewTypeIconAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _viewTypeIconAnimation.dispose();
  }

  Widget _createBody() {
    List<Dog> dogs = List.generate(500, (index) {
      final int imageIndex = (index % 5) + 1;

      String dogName;
      switch (imageIndex) {
        case 1:
          dogName = "Jack Russel";
          break;
        case 2:
          dogName = "Labrador";
          break;
        case 3:
          dogName = "Pug";
          break;
        case 4:
          dogName = "Rottweiler";
          break;
        case 5:
          dogName = "Pastor";
          break;
        default:
          dogName = "Dog";
          break;
      }

      final dogImagePath = "assets/images/dog$imageIndex.png";

      return Dog(
        name: dogName,
        imagePath: dogImagePath,
      );
    });

    if (_shouldShowGridView) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => _createItemView(dogs[index]),
        itemCount: dogs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => _createItemView(dogs[index]),
      itemCount: dogs.length,
      itemExtent: 250.0,
    );
  }

  Widget _createItemView(Dog dog) {
    return GestureDetector(
      onTap: () {
        pushScreen(context, DogDetailScreen(dog));
      },
      child: Stack(
        children: <Widget>[
          _createImage(dog.imagePath),
          _createLabel(dog.name),
        ],
      ),
    );
  }

  Widget _createImage(String assetName) {
    return SizedBox.expand(
      child: Image.asset(
        assetName,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _createLabel(String text) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 2.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black45,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createViewTypeAppBarButton() {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.list_view,
        progress: _viewTypeIconAnimation,
      ),
      onPressed: () {
        toggleShouldShowGridView();
      },
    );
  }

  void toggleShouldShowGridView() {
    setState(() {
      _shouldShowGridView = !_shouldShowGridView;
      if (_shouldShowGridView) {
        _viewTypeIconAnimation.forward();
      } else {
        _viewTypeIconAnimation.reverse();
      }
    });
  }
}

import 'package:class_01/model/dog.dart';
import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 1"),
        centerTitle: false,
      ),
      body: _createListView(),
    );
  }

  Widget _createListView() {
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

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final dog = dogs[index];
        return Stack(
          children: <Widget>[
            _createImage(dog.imagePath),
            _createLabel(dog.name),
          ],
        );
      },
      itemCount: dogs.length,
      itemExtent: 250.0,
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
        horizontal: 8.0,
        vertical: 2.0,
      ),
      color: Colors.black45,
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
}

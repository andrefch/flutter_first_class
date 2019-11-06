import 'package:class_01/model/dog.dart';
import 'package:flutter/material.dart';

class DogDetailScreen extends StatelessWidget {
  final Dog _dog;

  DogDetailScreen(Dog dog) : _dog = dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_dog.name),
        centerTitle: false,
      ),
      body: _createBody(),
    );
  }

  Widget _createBody() {
    return SizedBox.expand(
      child: Image.asset(
        _dog.imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

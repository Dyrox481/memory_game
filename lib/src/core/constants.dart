import 'package:flutter/material.dart';

/// List of all available play area sizes
const List<int> playAreaSizes = [4, 6, 8, 10];

/// List of all available card colors
const List<Color> cardColors = [
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.orange,
];

/// List of all available memory pictures
const List<Image> memoryPictures = [
  Image(image: AssetImage('assets/images/dog.png')),
  Image(image: AssetImage('assets/images/cat.png')),
  Image(image: AssetImage('assets/images/german_shepherd.png')),
  Image(image: AssetImage('assets/images/giraffe.png')),
  Image(image: AssetImage('assets/images/moose.png')),
];

/// Image of the memory cards backside
const Image backsideImage =
    Image(image: AssetImage('assets/images/flutter_logo.png'));

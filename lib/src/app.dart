import 'package:flutter/material.dart';
import 'package:memory_game/src/home/view/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.5,
            ),
      ),
      home: const Home(),
    );
  }
}

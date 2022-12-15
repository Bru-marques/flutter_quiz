import 'package:flutter/material.dart';
import 'package:quiz/page/home.dart';

void main() {
  runApp(const MyApp());
}

//SHA256:4VhiflTKcB7KNx+OMy3R9G7OyicwohWd1C6/RbV9Ccc brmarques1108@gmail.com

//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
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Home(),
    );
  }
}

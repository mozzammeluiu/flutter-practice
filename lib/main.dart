import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo Home Page')),
      body: Column(children: <Widget>[
       MyContent(), MyContent() 
      ]),
    );
  }
}

class MyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Hello, world!'),
    );
  }
}
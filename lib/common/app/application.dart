import 'package:flutter/material.dart';
import 'package:osp/features/home/presentation/home.dart';

class App extends StatelessWidget{
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'OSP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      );
  }
}


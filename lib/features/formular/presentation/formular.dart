import 'package:flutter/material.dart';

class Formular extends StatefulWidget {
  const Formular({Key? key}) : super(key: key);

  @override
  _FormularState createState() => _FormularState();
}

class _FormularState extends State<Formular> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Container(
        color: Color(0xffEEEDDE),),
         SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(),
                TextFormField(),
                TextFormField(),
                TextField()
              ],
            ),
          ),
        ),
      ])
      );
    
  }
}

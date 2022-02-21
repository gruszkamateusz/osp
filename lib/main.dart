import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'common/app/application.dart';
import 'di/di.dart';



void main() {
  setUpDatabase();
  runApp(const App());
}


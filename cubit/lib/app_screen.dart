import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  AppScreen({this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(content),
    ));
  }
}
import 'package:flutter/material.dart';

import 'app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppScreen extends StatelessWidget {
  AppScreen({this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Text(content),
      RaisedButton(
        onPressed: () {
          context.read<AppCubit>().fetchData();
        },
        child: Text('Logout'),
      )
    ])));
  }
}

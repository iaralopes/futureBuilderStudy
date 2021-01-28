import 'package:flutter/material.dart';

import 'app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScreen extends StatelessWidget {
  AppScreen();

  @override
  Widget build(BuildContext context) {
    final state = context.read<AppCubit>().state;
    String content = "";
    if (state is LoadedAppCubitState) content = state.content;

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(content),
          RaisedButton(
            onPressed: () {
              context.read<AppCubit>().fetchData();
            },
            child: Text('Logout'),
          )
        ],
      ),
    ));
  }
}

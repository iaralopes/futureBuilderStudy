import 'package:flutter/material.dart';

import 'app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScreen extends StatelessWidget {
  const AppScreen();

  @override
  Widget build(BuildContext context) {
    print('build AppScreen');
    final content = context.select((AppCubit value) {
      final state = value.state;
      if (state is LoadedAppCubitState) {
        return state.content;
      }
      return null;
    });

//    final state = context.watch<AppCubit>().state;
//    String content = "";
//    if (state is LoadedAppCubitState) content = state.content;

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

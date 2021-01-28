import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(LoadingAppCubitState());

  Future<void> fetchData() {
    if (!(state is LoadingAppCubitState)) emit(LoadingAppCubitState());

    return Future.delayed(Duration(seconds: 3), () {
      emit(LoadedAppCubitState(
          content: 'Hello World! - ${Random().nextInt(1000)}'));
    });
  }
}

abstract class AppCubitState {}

class LoadingAppCubitState extends AppCubitState {}

class LoadedAppCubitState extends AppCubitState {
  LoadedAppCubitState({this.content});

  final String content;
}

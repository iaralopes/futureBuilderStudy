import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(LoadingAppCubitState()) {
    Timer.periodic(Duration(seconds: 4), (_) {
      print('timer content');
      final myState = state;
      if (myState is LoadedAppCubitState)
        emit(LoadedAppCubitState(
            content: '${Random().nextInt(1000)}',
            customContent: myState.customContent));
    });

    Timer.periodic(Duration(seconds: 1), (_) {
      print('timer customContent');
      final myState = state;
      if (myState is LoadedAppCubitState)
        emit(LoadedAppCubitState(
            content: myState.content,
            customContent: '${Random().nextInt(1000)}'));
    });
  }

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
  LoadedAppCubitState({this.content, this.customContent});

  final String content;
  final String customContent;
}

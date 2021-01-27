import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(LoadingAppCubitState());

  Future<void> fetchData() => Future.delayed(Duration(seconds: 10), () {
        emit(LoadedAppCubitState(content: 'Loaded State Hello World!'));
      });
}

abstract class AppCubitState {}

class LoadingAppCubitState extends AppCubitState {}

class LoadedAppCubitState extends AppCubitState {
  LoadedAppCubitState({this.content});

  final String content;
}

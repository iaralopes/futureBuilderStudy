import 'package:cubit/app_cubit.dart';
import 'package:cubit/app_screen.dart';
import 'package:cubit/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..fetchData(),
      child: BlocBuilder<AppCubit, AppCubitState>(
        builder: (context, state) {
          if (state is LoadingAppCubitState) {
            return SplashScreen();
          }
          if (state is LoadedAppCubitState) {
            return AppScreen(content: state.content);
          }
          return Container();
        },
      ),
    );
  }
}

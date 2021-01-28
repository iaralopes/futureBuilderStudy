import 'package:cubit/app_cubit.dart';
import 'package:cubit/app_screen.dart';
import 'package:cubit/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build AppInit');
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..fetchData(),
      child: Builder(
        builder: (context) {
          print('build Builder');
          final isLoading = context.select(
              (AppCubit appCubit) => appCubit.state is LoadingAppCubitState);

          if (isLoading) {
            return const SplashScreen();
          } else {
            return const AppScreen();
          }
        },
      ),
    );
  }
}

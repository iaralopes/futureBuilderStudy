import 'package:flutter/cupertino.dart';
import 'package:future_builder/app_screen.dart';
import 'package:future_builder/error_screen.dart';
import 'package:future_builder/splash_screen.dart';

class AppInit extends StatelessWidget {
  Future<void> initialization = Future.delayed(Duration(seconds: 10));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) return ErrorScreen();

          if (snapshot.connectionState == ConnectionState.done)
            return AppScreen();

          return SplashScreen();
        });
  }
}

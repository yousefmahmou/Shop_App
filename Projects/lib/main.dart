/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_test/layout/news_app/cubit/cubit.dart';
import 'package:login_test/layout/news_app/cubit/states.dart';
import 'package:login_test/layout/news_app/news_screen.dart';
import 'package:login_test/shared/bloc_observer.dart';
import 'package:login_test/shared/network/remote/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            //هنعمل الثيم وثيم داتا عشان نتحكم في اللون ونعمل باكوارد بفولس عشان اتحكم في اللي فوق الاب بار
            //وبتاخد سيستم اوفرلاي والثيم داتا بيتحكم في الابليكشن كله ونعمل تيتل تيكست عشان نعدل في التيل الاب
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.purple,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.red,
                  statusBarBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: Colors.purple),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.purple,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.purple,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: Colors.purple),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.purple,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: ThemeMode.dark,
            // NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: Directionality(
                textDirection: TextDirection.ltr, child: NewsScreen()),
          );
        },
      ),
    );
  }
}*/
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:login_test/layout/todo_app/todo_layout.dart';
import 'package:login_test/shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  // constructor
  // build

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}

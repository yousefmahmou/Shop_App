import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/layout/social_layout_screen.dart';
import 'package:social_app/modules/socail_onboarding/onboarding_screen.dart';
import 'package:social_app/modules/social_login/social_login_screen.dart';
import 'package:social_app/shared/bloc_observer/bloc_observer.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/cubit/cubit_social_login/cubit_social_login.dart';
import 'package:social_app/shared/cubit/cubit_social_login/states_social_login.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init;
  await Cachehelper.init();
  bool? isDark = Cachehelper.getData(key: 'isDark');
  Widget widget;

  bool onBoarding = Cachehelper.getData(key: 'onBoarding');
  token = Cachehelper.getData(key: 'token');
  print(token);

  if (onBoarding != null) {
    if (token != null)
      widget = SocialLayoutScreen();
    else
      widget = SocialLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    isDark: isDark!,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({
    required this.isDark,
    required this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit()
      /* ..getHomeData()
        ..getCategories()
        ..getFavorites()
        ..getUserData(),*/
      ,
      child: BlocConsumer<SocialLoginCubit, SocialLoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            // themeMode:ShopLoginCubit.get(context).isDark? ThemeMode.dark: ThemeMode.light,
            home: SocialLoginScreen(),
          );
        },
      ),
    );
  }
}

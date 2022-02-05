import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:shopappapi/layout/shop_layout/shop_layout_screen.dart';
import 'package:shopappapi/modules/bloc_observer/bloc_observer.dart';
import 'package:shopappapi/modules/login/shop_login_screen.dart';
import 'package:shopappapi/modules/on_boarding/onboarding_screen.dart';
import 'package:shopappapi/shared/components/constant.dart';
import 'package:shopappapi/shared/cubit/cubit_login/cubit_shop_login.dart';
import 'package:shopappapi/shared/cubit/cubit_login/states_shop_login.dart';
import 'package:shopappapi/shared/cubit/cubit_register/cubit_shop_register.dart';
import 'package:shopappapi/shared/cubit/cubit_shop_app/cubit_shop_app.dart';
import 'package:shopappapi/shared/cubit/cubit_shop_app/states_shop_app.dart';
import 'package:shopappapi/shared/network/local/cache_helper.dart';
import 'package:shopappapi/shared/network/remote/dio_helper.dart';
import 'package:shopappapi/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init;
  await Cachehelper.init();
  //bool? isDark = Cachehelper.getData(key: 'isDark');
  Widget? widget;

  bool? onBoarding = Cachehelper.getData('onBoarding');
  token = Cachehelper.getData('token');
  print(token);
  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  //final bool isDark;
  final Widget startWidget;

  MyApp({
    // required this.isDark,
    required this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    /* return BlocProvider(
      create: (context) => ShopCubit()
        ..getHomeData()
        ..getCategories()
        ..getFavorites()
        ..getUserData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {*/

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopLoginCubit()),
        BlocProvider(
            create: (context) => ShopCubit()
              ..getHomeData()
              ..getCategories()
              ..getFavorites()
              ..getUserData()),
        BlocProvider(create: (context) => ShopRegisterCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //   theme: lightTheme,
        // darkTheme: darkTheme,
        //themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
      
      /* ),
    );
  }
}*/

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_projects/layout/shop_layout/shop_layout_screen.dart';
import 'package:test_projects/modules/bloc_observer/bloc_observer.dart';
import 'package:test_projects/modules/login/shop_login_screen.dart';
import 'package:test_projects/modules/on_boarding/onboarding_screen.dart';
import 'package:test_projects/shared/components/constant.dart';
import 'package:test_projects/shared/cubit/appcubit_search_cubit/appcubit.dart';
import 'package:test_projects/shared/cubit/cubit_login/cubit_shop_login.dart';
import 'package:test_projects/shared/cubit/cubit_register/cubit_shop_register.dart';
import 'package:test_projects/shared/network/local/catch_helper.dart';
import 'package:test_projects/shared/network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Diohelper.init();
  await CacheHelper.init();
  dynamic onBoardingFinish = false;
  onBoardingFinish = CacheHelper.getData('ShowOnBoard');
  token = CacheHelper.getData('token');
  print(token);
  late Widget start;
  if (onBoardingFinish != null) {
    if (token == null) {
      start = ShopLoginScreen();
    } else {
      start = const ShopAppLayout();
    }
  } else {
    start = OnBording_Screen();
  }

  runApp(MyApp(start));
}
// BlocOverrides.runZoned(
// () {
// // Use cubits...
// },
// blocObserver: MyBlocObserver(),
// );

class MyApp extends StatelessWidget {
  Widget startApp;

  MyApp(this.startApp);

  // his widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopAppLogincubit()),
        BlocProvider(
            create: (context) => ShopAppcubit()
              ..gethomedata()
              ..getAddresses()
              ..GetCategoryModel()
              ..getOrders()),
        BlocProvider(create: (context) => ShopAppRegistercubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: startApp,
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_projects/models/shop_login_model/shop_login_model.dart';
import 'package:test_projects/shared/cubit/cubit_login/states_shop_login.dart';
import 'package:test_projects/shared/network/end_points.dart';
import 'package:test_projects/shared/network/remote/dio_helper.dart';

class ShopAppLogincubit extends Cubit<ShopLoginStatus> {
  ShopAppLogincubit() : super(ShopLoginInitialStatus());
  ShopLoginModel? UserModel;

  static ShopAppLogincubit get(context) => BlocProvider.of(context);

  void UserLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLodingStatus());
    Diohelper.PostData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      UserModel = ShopLoginModel.formjson(value.data);
      emit(ShopLoginSuccessStatus(UserModel!));
    }).catchError((error) {
      print('  الايرور هنا  .........');
      print(error);
      emit(ShopLoginErrorStatus(error.toString()));
    });
  }

  IconData iconData = Icons.visibility_outlined;

  bool isoscureShow = true;

  void eyeisShow() {
    iconData = isoscureShow
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    isoscureShow = !isoscureShow;
    emit(IseyeShow());
  }
}

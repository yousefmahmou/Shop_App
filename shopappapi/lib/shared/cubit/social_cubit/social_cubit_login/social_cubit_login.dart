import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopappapi/shared/cubit/social_cubit/social_cubit_login/social_states_login.dart';

class SocialLoginCubit extends Cubit<SocialLoginState> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  /* void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = SocialLoginModel.fromJson(value.data);
      emit(SocialLoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(SocialLoginErrorState(error.toString()));
    });
  }*/

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisibilityState());
  }
}

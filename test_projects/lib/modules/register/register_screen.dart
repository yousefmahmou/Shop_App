import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_projects/layout/shop_layout/shop_layout_screen.dart';
import 'package:test_projects/modules/login/shop_login_screen.dart';
import 'package:test_projects/shared/components/components.dart';
import 'package:test_projects/shared/components/constant.dart';
import 'package:test_projects/shared/cubit/appcubit_search_cubit/appcubit.dart';
import 'package:test_projects/shared/cubit/cubit_register/cubit_shop_register.dart';
import 'package:test_projects/shared/cubit/cubit_register/state_shop_register.dart';

import 'package:test_projects/shared/network/local/catch_helper.dart';

class RefisterScreen extends StatelessWidget {
  var PasswordConerolar = TextEditingController();
  var NamedConerolar = TextEditingController();
  var EmailConerolar = TextEditingController();
  var PhoneConerolar = TextEditingController();
  var Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppRegistercubit, ShopRegisterStatus>(
      listener: (BuildContext context, state) {
        if (state is ShopRegisterSuccessStatus) {
          if (state.userRegisterModel.status == true) {
            print(state.userRegisterModel.status);
            print(state.userRegisterModel.message);
            print(state.userRegisterModel.data!.token);
            Fluttertoast.showToast(
                msg: state.userRegisterModel.message.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            CacheHelper.Savedataa(
                    key: 'token', value: state.userRegisterModel.data!.token)
                .then((value) {
              token = state.userRegisterModel.data!.token!;
              print(value.toString());
              NavegatandFinish(context, ShopAppLayout());
              NamedConerolar.clear();
              PhoneConerolar.clear();
              EmailConerolar.clear();
              PasswordConerolar.clear();
              // confirmPassword.clear();
              // navigateAndKill(context, ShopLayout());
              ShopAppcubit.get(context).currentindex = 0;
              ShopAppcubit.get(context).gethomedata();
              ShopAppcubit.get(context).getShopprofaileData();
              ShopAppcubit.get(context).GetFavData();
              ShopAppcubit.get(context).GetCartData();
              ShopAppcubit.get(context).getAddresses();
              ShopAppcubit.get(context).getOrders();
              ShopAppcubit.get(context).getOrdersDetails();
            }).catchError((error) {
              print(error.toString());
            });
          } else {
            Fluttertoast.showToast(
                msg: state.userRegisterModel.message.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = ShopAppRegistercubit.get(context);
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 1,
            title: Row(
              children: const [
                Image(
                  image: AssetImage('assets/images/image4.png'),
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Salla',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            elevation: 1.0,
            backgroundColor: Colors.white,
          ),
          body: Form(
            key: Formkey,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        'Register naw you browse our hot offers',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defulteditTextx(
                        Controlar: NamedConerolar,
                        keyboardType: TextInputType.text,
                        Lable: 'Full Name',
                        prefix: Icons.person,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'PLease Inter your Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defulteditTextx(
                        Controlar: EmailConerolar,
                        keyboardType: TextInputType.text,
                        Lable: 'Email',
                        prefix: Icons.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'PLease Inter your Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defulteditTextx(
                        Controlar: PhoneConerolar,
                        keyboardType: TextInputType.phone,
                        Lable: 'Phone',
                        prefix: Icons.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'PLease Inter your Phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defulteditTextx(
                        Controlar: PasswordConerolar,
                        keyboardType: TextInputType.text,
                        Lable: 'Password',
                        prefix: Icons.lock,
                        sufix: cubit.iconData,
                        obscureText: cubit.isoscureShow,
                        suffixPressed: () {
                          cubit.eyeisShow();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'PLease Inter your Password';
                          }
                          return null;
                        },
                        onfiled: (value) {
                          print(value);
                        },
                        onSubmit: (value) {
                          if (Formkey.currentState!.validate()) {
                            cubit.UserRegister(
                              email: EmailConerolar.text,
                              password: PasswordConerolar.text,
                              name: NamedConerolar.text,
                              phone: PhoneConerolar.text,
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      bottom(
                        width: double.infinity,
                        height: 50,
                        color: Colors.deepOrange,
                        onpressed: () {
                          if (Formkey.currentState!.validate()) {
                            cubit.UserRegister(
                              email: EmailConerolar.text,
                              password: PasswordConerolar.text,
                              name: NamedConerolar.text,
                              phone: PhoneConerolar.text,
                            );
                          }
                        },
                        text: 'REGISTER',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Have an account yet ?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              PushToNextScreen(context, ShopLoginScreen());
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

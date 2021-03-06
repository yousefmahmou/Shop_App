import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shopappapi/layout/shop_layout/shop_layout_screen.dart';
import 'package:shopappapi/modules/register/register_screen.dart';
import 'package:shopappapi/shared/components/components.dart';
import 'package:shopappapi/shared/components/constant.dart';
import 'package:shopappapi/shared/cubit/cubit_login/cubit_shop_login.dart';
import 'package:shopappapi/shared/cubit/cubit_login/states_shop_login.dart';
import 'package:shopappapi/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {
  var FormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
          listener: (context, state) {
        if (state is ShopLoginSuccessState) {
          if (state.loginModel.status!) {
            //   print(state.loginModel.message);
            //   print(state.loginModel.data!.token);
            showToast(
              text: state.loginModel.message!,
              state: ToastStates.SUCCESS,
            );
            Cachehelper.savaData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then((value) {
              //السطر ده عشان لما احذف الداتا ويحصل كيل للتوكين فمش هيدخل يلاقي االداتا موجوده و ميعملش ايرور لما ادخل تاني
              token = state.loginModel.data!.token!;
              navigateAndfinish(
                context,
                ShopLayout(),
              );
            });
          } else {
            print(state.loginModel.message);

            showToast(
              text: state.loginModel.message!,
              state: ToastStates.ERROR,
            );
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defaultTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Email is to Short';
                          }
                          return null;
                        },
                        label: 'Emial Address',
                        prefix: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Password is to Short';
                          }
                          return null;
                        },
                        ispassword: ShopLoginCubit.get(context).isPassword,
                        onsubmit: (value) {
                          ShopLoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                        suffixpressed: () {
                          ShopLoginCubit.get(context)
                              .changePasswordVisibility();
                        },
                        suffix: ShopLoginCubit.get(context).suffix,
                        prefix: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopLoginLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (FormKey.currentState!.validate())
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          },
                          text: 'LOGIN',
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),
                          defaultTextButton(
                            function: () {
                              navigateTo(
                                context,
                                ShopRegisterScreen(),
                              );
                            },
                            text: 'ReGister',
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
      }),
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopappapi/layout/shop_layout/shop_layout_screen.dart';
import 'package:shopappapi/shared/components/components.dart';
import 'package:shopappapi/shared/components/constant.dart';
import 'package:shopappapi/shared/cubit/cubit_register/cubit_shop_register.dart';
import 'package:shopappapi/shared/cubit/cubit_register/state_shop_register.dart';
import 'package:shopappapi/shared/network/local/cache_helper.dart';

class ShopRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.loginModel.status!) {
              //  print(state.loginModel.message);
              // print(state.loginModel.data!.token);
              showToast(
                text: state.loginModel.message!,
                state: ToastStates.SUCCESS,
              );
              Cachehelper.savaData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                //السطر ده عشان لما احذف الداتا ويحصل كيل للتوكين فمش هيدخل يلاقي االداتا موجوده و ميعملش ايرور لما ادخل تاني
                state.loginModel.data!.token!;
                token = state.loginModel.data!.token!;
                navigateAndfinish(
                  context,
                  ShopLayout(),
                );
              });
            } else {
              // print(state.loginModel.message);

              showToast(
                text: state.loginModel.message!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
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
                          'REGISTER',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'REgister now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Name is to Short';
                            }
                            return null;
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15,
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
                          label: 'Email Address',
                          prefix: Icons.email,
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
                          ispassword: ShopRegisterCubit.get(context).isPassword,
                          onsubmit: (value) {},
                          suffixpressed: () {
                            ShopRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          suffix: ShopRegisterCubit.get(context).suffix,
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: 'Phone',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Phone is to Short';
                            }
                            return null;
                          },
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (FormKey.currentState!.validate())
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                            },
                            text: 'REGISTER',
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

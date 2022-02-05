import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/social_register/cubit_social_register.dart';
import 'package:social_app/shared/cubit/social_register/states_social_register.dart';

class SocialRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterState>(
        listener: (context, state) {
          if (state is SocialRegisterSuccessState) {
            /* if (state.loginModel.status!) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);

              Cachehelper.savaData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                //السطر ده عشان لما احذف الداتا ويحصل كيل للتوكين فمش هيدخل يلاقي االداتا موجوده و ميعملش ايرور لما ادخل تاني
                token = state.loginModel.data!.token;
                navigateAndfinish(
                  context,
                 SocialLayout(),
                );
              });
            } else {
              print(state.loginModel.message);

              showToast(
                text: state.loginModel.message!,
                state: ToastStates.ERROR,
              );
            }*/
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      Text(
                        'REgister now to Login now to communicate with frinds',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defaultTextFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        label: 'User Name',
                        prefix: Icons.person,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
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
                        /*validate : (String? value) {
                                if (value!.isEmpty) {
                                  return 'Time Must be not empty';
                                }
                                return null;
                              },*/
                        ispassword: SocialRegisterCubit.get(context).isPassword,
                        onsubmit: (value) {},
                        suffixpressed: () {
                          SocialRegisterCubit.get(context)
                              .changePasswordVisibility();
                        },
                        suffix: SocialRegisterCubit.get(context).suffix,
                        prefix: Icons.lock_outline,
                      ),
                      defaultTextFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: 'Phone',
                        prefix: Icons.phone,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                        condition: state is! SocialRegisterLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            //         if (FormKey.currentState!.validate())
                            /* SocialRegisterCubit.get(context).userRegister(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );*/
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
          );
        },
      ),
    );
  }
}

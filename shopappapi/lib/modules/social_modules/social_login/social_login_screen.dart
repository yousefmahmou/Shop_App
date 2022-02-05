import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopappapi/modules/social_modules/social_register/social_register_screen.dart';
import 'package:shopappapi/shared/components/components.dart';
import 'package:shopappapi/shared/cubit/social_cubit/social_cubit_login/social_cubit_login.dart';
import 'package:shopappapi/shared/cubit/social_cubit/social_cubit_login/social_states_login.dart';

class SocialLoginScreen extends StatelessWidget {
  var FormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginState>(
          listener: (context, state) {},
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
                            'LOGIN',
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          Text(
                            'Login now to communicate with frinds',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          defaultTextFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
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
                                return 'Time Must be not empty';
                              }
                              return null;
                            },
                            ispassword:
                                SocialLoginCubit.get(context).isPassword,
                            onsubmit: (value) {
                              /* SocialLoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );*/
                            },
                            suffixpressed: () {
                              SocialLoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            suffix: SocialLoginCubit.get(context).suffix,
                            prefix: Icons.lock_outline,
                          ),
                          ConditionalBuilder(
                            condition: state is! SocialLoginLoadingState,
                            builder: (context) => defaultButton(
                              function: () {
                                if (FormKey.currentState!.validate()) {
                                  /*  SocialLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );*/
                                }
                              },
                              text: 'LOGIN',
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 30,
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
                                    SocialRegisterScreen(),
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

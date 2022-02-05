import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopappapi/shared/components/components.dart';
import 'package:shopappapi/shared/components/constant.dart';
import 'package:shopappapi/shared/cubit/cubit_shop_app/cubit_shop_app.dart';
import 'package:shopappapi/shared/cubit/cubit_shop_app/states_shop_app.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (state is shopLoadingUpdateUserState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                    controller: nameController,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Text is to Short';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
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
                    label: 'Email',
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Phone is to Short';
                      }
                      return null;
                    },
                    label: 'Phone',
                    prefix: Icons.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        ShopCubit.get(context).updateUserData(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                      }
                    },
                    text: 'Update',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: () {
                      signOut(context);
                    },
                    text: 'Logout',
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

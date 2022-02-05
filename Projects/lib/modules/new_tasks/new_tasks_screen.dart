import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/shared/components/components.dart';
import 'package:login_test/shared/components/constants.dart';
import 'package:login_test/shared/cubit/cubit.dart';
import 'package:login_test/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //جبنا الديفولت بيلد تاسك ايتم اللي جاهز وحطيناه في ليست فيو دوت سيبراتيد
    //عشان نظهر الداتا بيز في الاسكرينه هنعمل ليست اوف ماب واسمها ونحطها في اسكرينه الكونستانت
    //عشان تظهر لكل الاسكرينات ونحط اسم الليست في الايتم كونت
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newtasks;

        return tasksBuilder(
          tasks: tasks,
        );
      },
    );
  }
}

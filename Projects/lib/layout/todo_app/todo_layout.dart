import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:login_test/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:login_test/modules/done_tasks/done_tasks_screen.dart';
import 'package:login_test/modules/new_tasks/new_tasks_screen.dart';
import 'package:login_test/shared/components/components.dart';
import 'package:login_test/shared/components/constants.dart';
import 'package:login_test/shared/cubit/cubit.dart';
import 'package:login_test/shared/cubit/states.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';

//بعد ما اشيل الانت كرنت والاسكرينات في الكويبت
//هحط في الكونديشن
class HomeLayout extends StatelessWidget {
  //هبعت الداتا من خلال الديزاين هعمل سكافولد كي واحطه في سكافولد
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //الاسكرينه دي عشان بتحتوي علي اسكرينات ف هنحطها في لاي اوت
    //هنعملها ستيتفل عشان بتدخل علي اسكرينات تانيه
    //هنعمل الاببار وهنعمل الفلوتينج اكشن بوتون
    //وهنعمل بوتون نفيجاشين بار وفيه بوتوم نافيجشن بار فيه ايتمز فيه الايكون وكده وهنكررها مرتين تاني
    // هنعمل تيب فيه بوتوم نافجيشن بار تيب دوت فيكسد
    //وهنعمل كرنت اينديكس وهعمل فاريبل ب انت كرنت انديكس بيساوي صفر وهحط الفاريبل في الكرنت اينديكس
    //هعمل اون تاب يه اننوس ميثود قاينديكس وهعمل سيت ستيت فيها كرنت اينديكس بيساوي الاينديكس
    //وهعمل في المديولس الاسكرينات التلاته
    //عشان اتوجل او اغير او اقلب بين الاسكرينات يعني هعمل ليست اوف الحاجه اللي عايز اتوجل بينهم
    //وعشان احطهم في البودي لازم اتوجل بينهم ف هعمل ليست اوف ويديجيت واسمي الليست بيساوي واجيب الاسكرينات التلاته
    //واجي احط في البودي اسم الليست بين قوسين كرنت اينديكس
    //وعشان اتوجل بين العناوين اعمل ليست اوف سترينج اسم الليست بيساوي العناوين
    //واحطه في الاب بار اسم الليست اوف كرنت اينديكس

    //دي عشان هستخدم المثود كتير ف هاخد منها اوبجكت يبقي سهل الاستخدام

    return BlocProvider(
      //عشان اكريت الداتابيز هعمل عند الكريت في الابكيوبت اتنين دوت عشان يبقي اكني حطيته في فاريبل وعملت بعده دوت
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: ScaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentindex],
              ),
            ),

            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentindex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            //tasks.length > 0
            //? Center(child: CircularProgressIndicator())
            //: cubit.screens[cubit.currentindex],

            //عشان ندوس علي الزرار هنحتاج نعمل ميثود نحطها في الاون بيرسد
            //ونعملها اوبجيكت ب فيوتشر عشان هي حاجه لسه هتاجي
            //وعشان هتاجي ف هنعملها اسينك واويت
            //لما اجي اهندل ايرور بعمل تري وكاتش
            //التري بحط فيها اللي عايز اختبره اذا كان هيطلع ايرور ولا لا ف هحط فيها الجيت نيم
            //والكاتش هديها اننوس ميثود ب ايرور وبرينت الايرور قوسين ودولار سين ايرور دوت توسترينج قوسين وقبلها هعمل ثرو للايرور عشان امسكه
            //وفي طريقه تانيه اننا نستدعي الجيت نيم دوت زين اننوس ميثود ب فاليو وبرينت الفاليو دوت كاتش ايرور
            //وفيه اننوس ميثود بايرور  وبرينت دولار سين قوسين ايرور دوت تو سترينج واننوس ميثود فاضي
            //لو استخدمت طريقه الجيت هشيل الاسينك

            //هبعت الداتا من خلال الديزاين فهعمل في الاون بريسد سكافولد كي دوت كرنت ستيت دوت بوتوم شيت واعمل الديزاين
            // فهعمل كوتينر واعمله ديزاين وعشان هو لما بيفتح مش بيقفل الا لما اقفله بايدي فهعمل فاريبل
            //نوعه بوليان بفولس ونعمل حاله ايف يتقفل ب نافيجاتور دوت بوب لو ده بفولس ولو غلط ف نحط السكافولد في الايلس
            //ونعملها بتروو ونعمل الايكون بفاريبل برضو ايكون داتا والاسم بيساوي الايكون المستخدمه
            //ونحط الفاريبل في الايكون ونعمل سيت ستات في الاون بريسد
            //هنشيل الكونتينر وهنعمل كولمن فيه الديفولت تيكست فروم فيلد
            //وهنملي الحاجه اللي فيه الكونترولر هعمله فاريبل بتيكست ايدينينجكونرولر والتيب هعمله تيكست انبوت تيب دوت تيكست
            //والفاليدات هحطها عادي وليبل هعمل عنوان والبريفكس هعمل ايكون تيتل وهراب الكولمن بكونتينر واعمله بادينج
            //ونعمل واحد زيه بس للوقت وفيهه الاون تاب نعمل فيه شو تيم بيكر هيديني كونكست وانيشال تيم هنختار تيم اوف داي دوت ناو
            //وعشان الشو تيم بيكر فيةتشر هستخدم دوت زين وهعمل برينت فاليو دوت فورمات عشان انظم التيكست
            //وهعشان اطبع الوقت في الخانه هجيب التيم كونترولر دوت تيكست واحط اللي جوا البرينت
            //وهنعمل ديفولت فروم فيلد للتاريخ برضو زي الوقت وبدل ما هنحط في الاون تيب شو تيم هنحط شو ديت بيكر

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetSowen) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                  }
                  // if (formKey.currentState?.validate() ?? true) {
                  //  insertDatabase(
                  //  title: titleController.text,
                  //  time: timeController.text,
                  //  date: dateController.text,
                  // ).then((value) {
                  //  getDataFromDatabase(database).then((value)
                  // {
                  //   Navigator.pop(context);
                  // });

                  // isBottomSheetSowen = false;
                  // setState(() {
                  // fabIcon = Icons.edit;
                  // });
                  // });
                  // }
                } else {
                  ScaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(
                            20.0,
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultTextFormField(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Task must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Title',
                                  prefix: Icons.title,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                defaultTextFormField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value!.format(context).toString();
                                    });
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Task must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Time',
                                  prefix: Icons.watch_later_outlined,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                defaultTextFormField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-01-01'),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Task must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Date',
                                  prefix: Icons.calendar_today,
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 20,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });

                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              }
              //async {
              // try {
              // var name = await getName();
              //print(name);
              //throw ('some erorr');
              //} catch (erorr) {
              // print('erorr ${erorr.toString()}');
              //}
              // getName().then((value)
              //{
              //print(value);
              //throw('erorr!!');
              //}).catchError((error)
              //{
              //print('error is ${error.toString()}');
              //});
              //  },
              ,
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                //ده عشان اقدر اليسن عليه ف بعتله ميثود ده
                currentIndex: cubit.currentindex,
                onTap: (index) {
                  //هعمل في الستيت ستيت عشان ادوس علي البوتوم نفجيشن بار
                  //هستدعي الميثود ابكيوبت دوت جيت يبقي كده اخدت اوبجكت منه دوت الميثود اللي فيها التشانج وابعتلها الانديكس
                  //ابعت الانديكس عشان تسوايه بالكرنت
                  cubit.ChangeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                    ),
                    label: 'Tasks',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline),
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.archive_outlined,
                    ),
                    label: 'Archived',
                  ),
                ]),
          );
        },
      ),
    );
  }

  //Future<String> getName() async {
  // return 'aa';
  // }

//to use sqflite to create data base
//1.create db
//2.create tables
//3.open db هعمل اوبن عشان تديني اوبجيكت امسكه في ايدي عشان اعمل الحاجات التانيه دي
//4.insert to db
//5.get from db
//6.update in db
//7.delete from db
//هعمل لكل حاجه ميثود عشان تقسميه ونظام الكود
//هعمل ميثود للكرييت داتا بيز بريتورن فويد
//هعمل فيه اوبن داتابيز دي بترجع فيوتشر داتابيز فهعمل اسينك واويت ولازم اكتب اسم ليها ويكون دوت دي بي
//ولو الاسم موجود هيعمل الاون اوبن الاول واون كريت لو مش وجود يبقي هيعمل كريت وبعدين اوبن
//عشان الاكستنشن وهديها فيرجن واحد ولو غيرت حاجه اخليه اتنين وكده وهعمل اون كرييت اننوس ميثود ب داتابيز,فيرجن
//وبرينت هكتب كريتيد داتابيز
//وهعمل اون اوبن اننوس ميثود بداتابيز وبرينت نفس الكلام
//وهكريت الجدول ب سكول ستاتمينت في الاون كريت
//هعمل داتابيز دوت اكسكيوت ودي بتريتورن فيوتشر فويد فهعمل اسينك واويت او دوت زين اي طريقه عادي تنفع
//في الاكسكيوت هكتب كريت تابل تاسك وهفتح قوسين هكتب فيهم اسم ونوع كل كولمن في الجدول
//id int_title string_date string_ time string_status string دي اسم ونوع كل كولمن
//لما اكتبه هكتب النوع سمال والاسم كابتل وهعمل الاي دي بريمري كي والتيتل والباقي نوعه هكتبه تيكست
//وبعدين استدعي ميثود كريت داتابيز في البيلد ب انيت ستات

}

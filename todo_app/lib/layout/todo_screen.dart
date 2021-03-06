import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

//import 'package:sqflite/sqflite.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/todo_cubit.dart';
import 'package:todo_app/shared/cubit/todo_states.dart';

//بعد ما اشيل الانت كرنت والاسكرينات في الكويبت
//هحط في الكونديشن

class HomeLayout extends StatelessWidget {
  var titlecontrolar = TextEditingController();

  var datecontrolar = TextEditingController();

  var Timecontrolar = TextEditingController();

  var Scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc()..CreatDatabase(),
      child: BlocConsumer<bloc, appstatus>(
        listener: (context, status) {
          if (status is Appinsertdatabasestate) {
            Navigator.pop(context);
          }
        },
        builder: (context, status) {
          bloc cubit = bloc.get(context);
          return Scaffold(
            key: Scaffoldkey,
            appBar: AppBar(
              title: Text(
                'Todo App ',
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.openShowMottom) {
                  if (Scaffoldkey.currentState != null &&
                      formkey.currentState != null &&
                      formkey.currentState!.validate()) {
                    cubit.inserToDatabase(
                        title: titlecontrolar.text,
                        data: datecontrolar.text,
                        time: Timecontrolar.text);
                  }
                } else {
                  //فتح ال bottom Sheet وعرض العناصر بداخلها
                  cubit.openShowMottom = true;
                  Scaffoldkey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: defulteditTextx(
                                    ///edit text title
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Tasks Must be not  empty';
                                      }
                                      return null;
                                    },
                                    onchanged: (value) {
                                      print(value);
                                    },
                                    onfiled: (s) {
                                      print(s);
                                    },
                                    Controlar: titlecontrolar,
                                    keyboardType: TextInputType.text,
                                    Lable: 'Tasks title',
                                    prefix: Icons.title,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: defulteditTextx(
                                    ///edit text time
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Time Must be not empty';
                                      }
                                      return null;
                                    },
                                    Controlar: Timecontrolar,
                                    keyboardType: TextInputType.datetime,
                                    Lable: 'Time',
                                    prefix: Icons.watch_later_outlined,
                                    ontab: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then(
                                        (value) => {
                                          print(value!.format(context)),
                                          Timecontrolar.text =
                                              value.format(context).toString(),
                                        },
                                      );
                                    }, //ontap
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  ///edit text date
                                  child: defulteditTextx(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Date must be not empty';
                                      }
                                      return null;
                                    },
                                    Controlar: datecontrolar,
                                    keyboardType: TextInputType.datetime,
                                    Lable: 'Date',
                                    prefix: Icons.date_range,
                                    ontab: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2022-01-01'))
                                          .then((value) => {
                                                datecontrolar.text =
                                                    DateFormat.yMMMd()
                                                        .format(value!),
                                              });
                                    },
                                  ),
                                ),
                                /////
                              ],
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                    cubit.showbottomsheeat(icon: Icons.edit, isShow: false);
                  });
                  cubit.showbottomsheeat(icon: Icons.add, isShow: true);
                }
              }, ////
              child: Icon(
                cubit.iconData,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 20.0,
              elevation: 15.0,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.navchange(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.table_rows_sharp),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
            body: cubit.models[cubit.currentIndex],
          );
        },
      ),
    );
  }
}

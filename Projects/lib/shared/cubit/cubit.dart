import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_test/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:login_test/modules/done_tasks/done_tasks_screen.dart';
import 'package:login_test/modules/new_tasks/new_tasks_screen.dart';
import 'package:login_test/shared/components/constants.dart';
import 'package:login_test/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/shared/cubit/cubit.dart';
import 'package:sqflite/sqflite.dart';
//هنستخدم الكيوبت في التودو ف هنعمل نفس اللي عملناه في الكونتر
//هجيب الانت كرنت والاسكرينات والتيتل احطهم هنا عشان اعمل ليسن عليهم اسمعهم يعني
//هعمل ميثود هعرف الانديكس  واحط فيها الكرنت انديكس بيساوي انديكس واعمل ايميت للتسيت اللي هيحصل فيها التغير

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void ChangeIndex(int index) {
    currentindex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivedtasks = [];
  //مش هنعمل حاجه في الكريت الا بس هنشيل داتابيز اويت واسينك واعمل دوت زين عشان اعرف انه خلص  ونعمل ايميت بس
  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) async {
      print('database created');
      await database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT ,time TEXT,status TEXT)');
      try {
        print('table created');
      } catch (error) {
        print('error ${error.toString()}');
      }
    }, onOpen: (database) {
      getDataFromDatabase(database);
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  //بعد ما اعمل الديزاين اعمل اسيرت الداتابيز واحطها في الاون بريسد واعمل ريتورن للداتابيز ترانسكشن
  //واعملها بدل فويد فيوتشر فهعمل اسينك واويت واعمل في الاون بريسد انسيرت داتا بيز دوت زين ةالزرار
  //واعمل تحت في الفيوتشر داتا بيز افتح قوسين واحط الاتربيوتس للتيتل والتيم والتاريخ ب ريكويرد
  //وفي الرو انسيرت في الفاليو احط دولار سين والتيتل والوقت والتاريخ
  //وفوق في الاون بريسد جوا الانسيرت احط الاتربيوتس بس دوت تيسكت
  insertDatabase({
    String? title,
    String? time,
    String? date,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
        'INSERT INTO tasks(title ,date,time,status) VALUES("$title","$date","$time","name")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('error when insert ${error.toString()}');
      });
    });
  }
  //To Get Database
  //هنعمل ليست اوف ماب عشان نقدر نجيب الداتبيز كلها ونعملها فيوتشر عشان ميحصلش ايرور
  //لان هحط في الكريت داتابيز في الاون اوبن الجيت دوت زين واعمل فاريبل تاسك بيساوي فاليوف هخليها فيوتشر عشان تلحق تتكريت
  //وهعمل ريتورن الدتابيزدوت كويري والجمله عادي

  void getDataFromDatabase(database) {
    newtasks = [];
    donetasks = [];
    archivedtasks = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newtasks.add(element);
        else if (element['status'] == 'done')
          donetasks.add(element);
        else
          archivedtasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    String? status,
    int? id,
  }) async {
    database.rawUpdate(
      'UPDATE Tasks SET status = ?,  WHERE id =?',
      ['$status', id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    int? id,
  }) async {
    database
        .rawDelete(
      'DELETE FROM Tasks WHERE id = ?,  [id]',
    )
        .then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetSowen = false;
  IconData fabIcon = Icons.add;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetSowen = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}

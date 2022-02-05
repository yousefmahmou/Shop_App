import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_test/layout/news_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/modules/business_news/business_screen.dart';
import 'package:login_test/modules/sciences_news/sciences_screen.dart';
import 'package:login_test/modules/settings_screen/settings_screen.dart';
import 'package:login_test/modules/sports_news/sports_screen.dart';
import 'package:login_test/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Busoness'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Sciences'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SciencesScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNav());
  }

  List<dynamic> business = [];
  void getBusiness() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetSciencesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSciencesErrorState(error.toString()));
    });
  }

  bool? isDark = false;
  ThemeMode appMode = ThemeMode.dark;
  void changeAppMode() {
    isDark = isDark!;
    emit(NewsChangeModeState());
  }
}

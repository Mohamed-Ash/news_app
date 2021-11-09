import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_eg/const/network/remote/dio_helper.dart';
import 'package:news_app_eg/model/business/business_screen.dart';
import 'package:news_app_eg/model/science/science_screen.dart';
import 'package:news_app_eg/model/sports/sports_screen.dart';
import 'package:news_app_eg/modules/settings.dart';
import 'package:news_app_eg/shared/cache_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Technology'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screens = [
    TechnologyScreen(),
     SportsScreen(),
     SciencesScreen(),
     SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> technology = [];
  void getTechnology() {
    emit(NewsGetTechnologyState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': 'e24f21b3dc914b2a8a0abac739ff8576',
      },
    ).then((value) {
      technology = value.data['articles'];
      print(technology[0]);
      emit(NewsGetTechnologyLoadingState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetTechnologyErrorState(error.toString()));
    });
  }
  List<dynamic> sciences = [];
  void getSciences() {
    emit(NewsGetSciencesState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'e24f21b3dc914b2a8a0abac739ff8576',
      },
    ).then((value) {
      sciences = value.data['articles'];
      print(sciences[0]);
      emit(NewsGetSciencesLoadingState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSciencesErrorState(error.toString()));
    });
  }
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'e24f21b3dc914b2a8a0abac739ff8576',
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]);
      emit(NewsGetSportsSLoadingState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsSErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeAppMode({ bool ? fromShared}) {
    if(fromShared !=null) {
      isDark =fromShared;
      emit(NewsAppChangeAppModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsAppChangeAppModeState());
      });
    }
  }
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {

        'q': value,
        'apiKey': 'e24f21b3dc914b2a8a0abac739ff8576',
      },
    ).then((value) {
      search = value.data['articles'];
      print(sports[0]);
      emit(NewsGetSearchLoadingState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
  // void getSearch() {
  //   emit(NewsGetSportsState());
  //   DioHelper.getData(
  //       search = value.data['articles'], query: {}, url: '';
  //       print(sports[0]);
  //   emit(NewsGetSportsSLoadingState());
  //   print(error.toString());
  //   emit(NewsGetSportsSErrorState(error.toString()));
  //   );
  // }

}
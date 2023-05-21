import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business.dart';
import 'package:news_app/dio_helper.dart';
import 'package:news_app/health.dart';
import 'package:news_app/science.dart';
import 'package:news_app/sports.dart';
import 'package:news_app/state.dart';

class AppCubit extends Cubit<AppState>{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;


  List<Widget>screens = [
    businessScreen(),
    sportsScreen(),
    healthScreen(),
    scienceScreen(),
  ];

  List<String> title = [
    'Business',
    'Sports',
    'Health',
    'Science',
  ];

  void onItemTaped(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
}


List<dynamic>business = [] ;

  void getBusiness(){

    emit(NewsGetBusinessLoadingState());

     dioHelper.getData(
        url: 'v2/top-headlines',
      query:{
          'country':'us',
          'category':'business',
          'apiKey':'d58cf78cada94415acf299f82a8482c9'
      }
    ).then((value){
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState());
    });
  }



  List<dynamic>sports = [];

  void getSports(){
    emit(NewsGetSportSuccessState());

    dioHelper.getData(
        url: 'v2/top-headlines',
        query: {
    'country':'us',
    'category':'sport',
    'apiKey':'d58cf78cada94415acf299f82a8482c9'
     }
    ).then((value){
      sports = value.data['articles'];
      emit(NewsGetSportSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportErrorState());
    });
  }


  List<dynamic>health = [];

  void getHealth(){
    emit(NewsGetHealthLoadingState());

    dioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'health',
          'apiKey':'d58cf78cada94415acf299f82a8482c9'
        }
    ).then((value){
      health = value.data['articles'];
      emit(NewsGetHealthSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetHealthErrorState());
    });
  }





  List<dynamic>science = [];

  void getScience(){
    emit(NewsGetScienceLoadingState());

    dioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'d58cf78cada94415acf299f82a8482c9'
        }
    ).then((value){
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState());
    });
  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    dioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'d58cf78cada94415acf299f82a8482c9',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState());
    });
  }


}

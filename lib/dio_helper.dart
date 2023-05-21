//https://newsapi.org/v2/top-headlines?
// country=eg&
// category=sport&apiKey=d58cf78cada94415acf299f82a8482c9

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d58cf78cada94415acf299f82a8482c9

class dioHelper{

  static Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }



  static Future<Response>getData({
  @required String url,
  Map<String , dynamic>query

  })async{

    return await dio.get(
      url,
      queryParameters: query,
    );
  }






}
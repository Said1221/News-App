import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/dio_helper.dart';
import 'package:news_app/newsLayout.dart';

void main() {

  dioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.teal,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
          )
      ),

      home: newsLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/dio_helper.dart';
import 'package:news_app/search.dart';
import 'package:news_app/state.dart';

class newsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusiness()..getSports()..getHealth()..getScience(),
      child: BlocConsumer <AppCubit , AppState> (
           listener: (BuildContext context ,AppState state){},
        builder: (BuildContext context , AppState state){
             AppCubit cubit =AppCubit.get(context);
             return Scaffold(
               appBar: AppBar(
                 title: Text('${cubit.title[cubit.currentIndex]}'),
                 actions: [
                   IconButton(onPressed: (){
                     navigateTo(context, searchScreen());
                   },
                       icon: Icon(Icons.search),

                   ),
                 ],
               ),

               body: cubit.screens[cubit.currentIndex],

               bottomNavigationBar: BottomNavigationBar(
                 type: BottomNavigationBarType.fixed,
                 currentIndex: cubit.currentIndex,
                 selectedItemColor: Colors.teal,
                 onTap: (index){
                   cubit.onItemTaped(index);
                 },

                 items: [

                   BottomNavigationBarItem(
                     icon : Icon(
                       Icons.business_sharp,
                     ),
                     label: 'Business',
                   ),

                   BottomNavigationBarItem(
                     icon : Icon(
                       Icons.sports,
                     ),
                     label: 'Sports',
                   ),


                   BottomNavigationBarItem(
                     icon : Icon(
                       Icons.health_and_safety,
                     ),
                     label: 'Health',
                   ),




                   BottomNavigationBarItem(
                     icon : Icon(
                       Icons.science,
                     ),
                     label: 'Science',
                   ),

                 ],
               ),


             );
        },
      ),
    );
  }
}

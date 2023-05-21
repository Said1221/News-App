import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/state.dart';


class searchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {


          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:

                  TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      AppCubit.get(context).getSearch(value);
                      },
                    decoration: InputDecoration(
                      label: Text('Search'),
                    ),
                  ),

                ),
                Expanded(
                  child: articalBuilder(
                    AppCubit.get(context).search,
                    context,
                    // isSearch: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

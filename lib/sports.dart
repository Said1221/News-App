
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/state.dart';

class sportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){
        return articalBuilder(AppCubit.get(context).sports , context);
      },
    );
  }
}

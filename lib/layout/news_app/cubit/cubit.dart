import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apis/layout/news_app/cubit/states.dart';
import 'package:news_apis/modules/business/business.dart';
import 'package:news_apis/modules/science/science.dart';
import 'package:news_apis/modules/setting/setting.dart';
import 'package:news_apis/modules/sports/sports.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context)=> BlocProvider.of(context);


  List<Widget> screens =
  [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingScreen(),
  ];

  List<String> titles =
  [
    'Business',
    'Sports',
    'Science',
    'Setting',
  ];

  int currentIndex = 0;
  void changeBottomNav(index)
  {
    currentIndex = index;
    emit(NewsBottomNavStates());
  }

}
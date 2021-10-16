import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apis/layout/news_app/cubit/cubit_observer.dart';
import 'package:news_apis/layout/news_app/news_layout.dart';
import 'package:news_apis/shared/network/remote/dio_helper.dart';
import 'package:news_apis/shared/styles/themes.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(debugShowCheckedModeBanner: false,
      theme:  lightTheme,
      home: const NewsLayout(),
    );
  }
}

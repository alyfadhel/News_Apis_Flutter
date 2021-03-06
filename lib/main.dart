import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_apis/layout/news_app/cubit/cubit.dart';
import 'package:news_apis/layout/news_app/cubit/cubit_observer.dart';
import 'package:news_apis/layout/news_app/cubit/states.dart';
import 'package:news_apis/layout/news_app/news_layout.dart';
import 'package:news_apis/shared/network/local/cache_helper.dart';
import 'package:news_apis/shared/network/remote/dio_helper.dart';
import 'package:news_apis/shared/styles/themes/cubit.dart';
import 'package:news_apis/shared/styles/themes/states.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'shared/styles/themes/themes.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  //if(Platform.isWindows)

  //await DesktopWindow.setMinWindowSize(const Size(400.0, 400.0));

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  final bool? isDark;
  const MyApp(this.isDark); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(create: (BuildContext context) =>ThemeModeCubit()..changeAppMode(
          fromShared: isDark,
        ),),
      ],
      child: BlocConsumer<ThemeModeCubit,ThemeModeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {



          return MaterialApp(debugShowCheckedModeBanner: false,
            theme:  lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeModeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}

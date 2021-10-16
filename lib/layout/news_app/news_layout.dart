import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apis/layout/news_app/cubit/cubit.dart';
import 'package:news_apis/layout/news_app/cubit/states.dart';
import 'package:news_apis/modules/business/business.dart';
import 'package:news_apis/modules/setting/setting.dart';
import 'package:news_apis/shared/network/remote/dio_helper.dart';
import 'package:news_apis/shared/styles/Iconly-Broken_icons.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
              actions: 
              [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                  Iconly_Broken.Search
                ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNav(index);
              },
                items:
                 const [
                   BottomNavigationBarItem(icon:
                   Icon(
                     Iconly_Broken.Paper
                   ),label: 'Business'),
                   BottomNavigationBarItem(icon:
                   Icon(
                       Iconly_Broken.Game
                   ),label: 'Sports'),
                   BottomNavigationBarItem(icon:
                   Icon(
                       Icons.science
                   ),label: 'Science'),
                   BottomNavigationBarItem(icon:
                   Icon(
                       Iconly_Broken.Setting
                   ),label: 'Setting'),
                ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}

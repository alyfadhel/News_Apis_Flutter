import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apis/layout/news_app/cubit/states.dart';
import 'package:news_apis/modules/business/business.dart';
import 'package:news_apis/modules/science/science.dart';
import 'package:news_apis/modules/setting/setting.dart';
import 'package:news_apis/modules/sports/sports.dart';
import 'package:news_apis/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context)=> BlocProvider.of(context);


  List<Widget> screens =
  [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  List<String> titles =
  [
    'Business',
    'Sports',
    'Science',
  ];

  int currentIndex = 0;
  void changeBottomNav(index)
  {
    currentIndex = index;
    emit(NewsBottomNavStates());
  }


  List<dynamic>business = [];
 // List<bool>selectBusinessItem = [];
  int? selectedBusinessItem;

  List<dynamic>sports = [];

  List<dynamic>science = [];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':'c799708afa624ae3b9742682fb271251',
      },
    ).then((value)
    {
     // print(value.data['articles'][1]['title']);
      business = value.data['articles'];
      // business.forEach((element) {
      //   selectBusinessItem.add(false);
      // });
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void businessSelectItem(index)
  {
    // for(int i = 0 ; i<selectBusinessItem.length;i++)
    // {
    //   if(i==index)
    //   {
    //     selectBusinessItem[i] = true;
    //   }else{
    //     selectBusinessItem[i] = false;
    //   }
    // }
    selectedBusinessItem = index;
    emit(NewsSelectBusinessItemState());

  }

  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'sports',
        'apiKey':'c799708afa624ae3b9742682fb271251',
      },
    ).then((value)
    {
      // print(value.data['articles'][1]['title']);
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }


  void getScience()
  {
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'science',
        'apiKey':'c799708afa624ae3b9742682fb271251',
      },
    ).then((value)
    {
      // print(value.data['articles'][1]['title']);
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsSearchLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q':value,
          'apiKey':'c799708afa624ae3b9742682fb271251',
        },
    ).then((value)
    {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsSearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
    });
  }

  bool isDesktop = false;
  void setupDesktop(bool value)
  {
    isDesktop = value;
    emit(NewsDesktopSetupState());
  }

}
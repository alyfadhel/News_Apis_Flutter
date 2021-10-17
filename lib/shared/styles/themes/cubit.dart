import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apis/shared/network/local/cache_helper.dart';
import 'package:news_apis/shared/styles/themes/states.dart';

class ThemeModeCubit extends Cubit<ThemeModeStates>
{
  ThemeModeCubit() : super(ThemeModeInitialStates());

  static ThemeModeCubit get(context)=>BlocProvider.of(context);


  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(ChangeAppModeState());
    }else{
      isDark = !isDark;
      CacheHelper.setData(key: 'isDark', value: isDark).then((value)
      {
        emit(ChangeAppModeState());
      });
    }
  }

}
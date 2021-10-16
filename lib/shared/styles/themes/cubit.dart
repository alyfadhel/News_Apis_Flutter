import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apis/shared/styles/themes/states.dart';

class ThemeModeCubit extends Cubit<ThemeModeStates>
{
  ThemeModeCubit() : super(ThemeModeInitialStates());

  static ThemeModeCubit get(context)=>BlocProvider.of(context);


  bool isDark = false;

  void changeAppMode()
  {
    isDark = !isDark;
    emit(ChangeAppModeState());
  }

}
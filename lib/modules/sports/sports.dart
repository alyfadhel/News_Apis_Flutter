import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:news_apis/layout/news_app/cubit/cubit.dart';
import 'package:news_apis/layout/news_app/cubit/states.dart';
import 'package:news_apis/shared/compontents/compontents.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var cubitSports = NewsCubit.get(context).sports;

        return Conditional.single(
          context: context,
          conditionBuilder: (context) => state is ! NewsGetSportsLoadingState,
          widgetBuilder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticlesItem(context, cubitSports[index]),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: NewsCubit.get(context).sports.length,
          ),
          fallbackBuilder: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

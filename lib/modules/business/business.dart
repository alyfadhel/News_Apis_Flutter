import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:news_apis/layout/news_app/cubit/cubit.dart';
import 'package:news_apis/layout/news_app/cubit/states.dart';
import 'package:news_apis/shared/compontents/compontents.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var cubitBusiness = NewsCubit.get(context).business;

        return Conditional.single(
          context: context,
          conditionBuilder: (context) => state is ! NewsGetBusinessLoadingState,
          widgetBuilder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticlesItem(context, cubitBusiness[index]),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              itemCount: NewsCubit.get(context).business.length,
          ),
          fallbackBuilder: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

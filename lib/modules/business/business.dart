import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:news_apis/layout/news_app/cubit/cubit.dart';
import 'package:news_apis/layout/news_app/cubit/states.dart';
import 'package:news_apis/shared/compontents/compontents.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var list = NewsCubit.get(context).business;

        return ScreenTypeLayout(
          mobile: Builder(
            builder: (context) {
              NewsCubit.get(context).setupDesktop(false);
              return articleBuilder(context,list);
            }
          ),
          desktop: Builder(
            builder: (context) {
              NewsCubit.get(context).setupDesktop(true);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Expanded(
                      child:
                      articleBuilder(context,list),
                  ),
                   Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[300],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            '${list[NewsCubit.get(context).selectedBusinessItem!]['description']}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 25.0,
                              height: 2
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
          breakpoints: const ScreenBreakpoints(
              desktop: 600.0,
              tablet: 300.0,
              watch: 300.0,
          ),
        );
      },
    );
  }
}

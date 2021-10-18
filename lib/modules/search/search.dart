import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:news_apis/layout/news_app/cubit/cubit.dart';
import 'package:news_apis/layout/news_app/cubit/states.dart';
import 'package:news_apis/shared/compontents/compontents.dart';

var searchController = TextEditingController();
bool isSearch = true;
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context).search;


        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: buildFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Search must not empty';
                    }
                    return null;
                  },
                  prefix: Icons.search,
                  label: 'search',
                ),
              ),
              Expanded(
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      state is! NewsSearchLoadingState,
                  widgetBuilder: (context) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildArticlesItem(context, cubit[index]),
                    separatorBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                    itemCount: NewsCubit.get(context).search.length,
                  ),
                  fallbackBuilder: (context) =>isSearch? Container() : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

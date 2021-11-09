import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_eg/business/news_cubit.dart';
import 'package:news_app_eg/const/network/get_news_api.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
       NewsCubit cubit = NewsCubit.get(context);
        return BuildCondition(
          fallback: (context)=>const Center(
            child: CircularProgressIndicator(),
          ),
          condition: state is! NewsGetSciencesLoadingState,
          builder: (context)=>ListView.separated(
            physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>buildArticleItem(cubit.sciences[index], context),
              separatorBuilder: (context,index)=>myDivider(),
              itemCount: cubit.sciences.length,
          ),
        );
      },
    );
  }
}

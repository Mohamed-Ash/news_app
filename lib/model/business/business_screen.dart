import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_eg/business/news_cubit.dart';
import 'package:news_app_eg/const/network/get_news_api.dart';

class TechnologyScreen extends StatelessWidget {
  NewsCubit cubit = NewsCubit();

  TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsState>(
      builder: (context,state){
        if(state is! ApiDataLoadedState) {
          return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildArticleItem(cubit.technology[index], context),
                separatorBuilder: (context,index)=>myDivider(),
                itemCount: cubit.technology.length
          );
        }else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
/* 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
          return 
          if(state is! NewsGetTechnologyLoadingState )
         /*    fallback:(context)=>const Center(
              child: CircularProgressIndicator(),
            ) ,
            condition:state is! NewsGetTechnologyLoadingState ,
            builder: (context)=>ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>buildArticleItem(cubit.technology[index], context),
              separatorBuilder: (context,index)=>myDivider(),
              itemCount: cubit.technology.length
            ),
        ); */

          /*  return BuildCondition(
          fallback:(context)=>const Center(
            child: CircularProgressIndicator(),
          ) ,
          condition:state is! NewsGetTechnologyLoadingState ,
          builder: (context)=>ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>buildArticleItem(cubit.technology[index], context),
              separatorBuilder: (context,index)=>myDivider(),
              itemCount: cubit.technology.length
          ),

        ); */
      },
    );
  } */
}

// state is! NewsGetLoadingState
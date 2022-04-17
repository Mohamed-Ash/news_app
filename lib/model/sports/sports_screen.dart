import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_eg/business/news_cubit.dart';
import 'package:news_app_eg/const/network/get_news_api.dart';


class SportsScreen extends StatelessWidget {
  
  SportsScreen({Key? key}) : super(key: key);
  final NewsCubit cubit = NewsCubit();

  @override
  Widget build(BuildContext context){
    return BlocBuilder<NewsCubit,NewsState>(
      builder: (context , state){
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
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_eg/business/news_cubit.dart';
import 'package:news_app_eg/const/network/get_news_api.dart';
import 'package:news_app_eg/model/search/search.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            appBar: AppBar(
              title: const Text(
                'News App'
              ),
              actions: [
                IconButton(onPressed: (){
                  navigateTo(context, SearchScreen());
                },
                    icon: const Icon(Icons.search)),
                IconButton(onPressed: (){
                  NewsCubit.get(context).changeAppMode();
                },
                    icon: const Icon(Icons.brightness_4_outlined),),
              ],

            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
            ),

          );
        },
    );
  }
}

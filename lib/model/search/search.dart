// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_eg/business/news_cubit.dart';
import 'package:news_app_eg/const/network/get_news_api.dart';

/* class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          body: Column(
            children: [
              Padding(padding: const EdgeInsets.all(20.0),
                child:  defaultFormField(
                  controller: searchController,
                  labelText: 'search',
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'must not be empty';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: Icons.search,
                  type: TextInputType.text,
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),

              ),
              Expanded(child: articleBuilder(list,context))

            ],
          ),
        );
      },
    );
  }
} */
class SearchScreen extends StatelessWidget {

  NewsCubit cubit = NewsCubit.get(BuildContext);

  var searchController = TextEditingController();
  
  getSearch(){
      if(cubit.search.isNotEmpty) {
        Expanded(
          child: articleBuilder(
            cubit.search,
            context,
          ),
        );
      } else {
          const CircularProgressIndicator();
      }
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  labelText: 'Search',
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  prefixIcon: Icons.search,
                  onChange: (value) {
                    cubit.getSearch(value);
                  },
                  type: TextInputType.text,
                ),
              ),
              
            /*   BuildCondition(
                condition: (cubit.search.isNotEmpty),
                builder: (BuildContext context) {
                  return Expanded(
                    child: articleBuilder(
                      cubit.search,
                      context,
                    ),
                  );
                },
                fallback: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ), */
            ],
          ),
        );
      },
    );
  }
}
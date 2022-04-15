
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_eg/const/network/remote/dio_helper.dart';
import 'package:news_app_eg/lay_out/news_layout/news_layout.dart';
import 'package:news_app_eg/shared/bloc_observer.dart';
import 'package:news_app_eg/shared/cache_helper.dart';

import 'business/news_cubit.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.iniT();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark?? false));
}

class MyApp extends StatelessWidget {


   final bool  isDark ;
    const MyApp(this.isDark, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..changeAppMode(fromShared: isDark,)
        ..getTechnology()
        ..getSports()
        ..getSciences(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          NewsCubit cubit = BlocProvider.of(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: cubit.isDark ? ThemeMode.light : ThemeMode.dark,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 20.0,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: const Color(0xFF333739),
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFF333739),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color(0xFF333739),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 20.0,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Color(0xFF333739),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}



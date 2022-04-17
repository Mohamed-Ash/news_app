part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsBottomNavState extends NewsState {}
class NewsGetTechnologyState extends NewsState {}
class NewsGetTechnologyLoadingState extends NewsState {}
class ApiDataLoadedState extends NewsState {}
class NewsGetTechnologyErrorState extends NewsState
{
  final String error;


  NewsGetTechnologyErrorState(this.error);
}
class NewsGetSciencesState extends NewsState {}
class NewsGetSciencesLoadingState extends NewsState {}
class NewsGetSciencesErrorState extends NewsState
{
  final String error;

  NewsGetSciencesErrorState(this.error);
}
class NewsGetSportsState extends NewsState {}
class NewsGetSportsSLoadingState extends NewsState {}
class NewsGetSportsSErrorState extends NewsState
{
  final String error;

  NewsGetSportsSErrorState(this.error);
}
class NewsAppChangeAppModeState extends NewsState {}
class NewsGetSearchState extends NewsState {}
class NewsGetSearchLoadingState extends NewsState {}
class NewsGetSearchErrorState extends NewsState
{
  final String error;

  NewsGetSearchErrorState(this.error);
}
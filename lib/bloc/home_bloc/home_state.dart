part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeChangeIndex extends HomeState {}
class HomeGetDataSuss extends HomeState {
  final HomeData homeData ;
  HomeGetDataSuss(this.homeData);
}
class HomeGetDataLoading extends HomeState {}
class HomeGetDataError extends HomeState {
  late final String error ;
  HomeGetDataError(this.error);
}



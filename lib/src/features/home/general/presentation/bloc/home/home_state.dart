part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

/// --------------------Start Home-------------------- ///

/// Loading feature name state
class LoadingDataState extends HomeState {}

/// Error feature name state
class ErrorDataState extends HomeState {
  final String errorMsg;

  ErrorDataState(this.errorMsg);
}

/// Success feature name state
class SuccessDataState extends HomeState {}

/// --------------------End Home-------------------- ///

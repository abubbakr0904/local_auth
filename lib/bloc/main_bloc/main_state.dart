part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  const MainState();
}

final class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

final class ErrorState extends MainState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends MainState {
  @override
  List<Object> get props => [];
}

final class FingerPrintSuccessState extends MainState {
  @override
  List<Object> get props => [];
}

final class FaceIdSuccessState extends MainState {
  @override
  List<Object> get props => [];
}


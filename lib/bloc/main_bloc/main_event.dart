part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();
}

class FingerPrintEvent extends MainEvent{
  final LocalAuthentication auth;
  const FingerPrintEvent({required this.auth});

  @override
  List<Object> get props => [];
}

class FaceIdEvent extends MainEvent{

  @override
  List<Object> get props => [];
}


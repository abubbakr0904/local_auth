import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_authbek/data/main_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository mainRepository;
  MainBloc(this.mainRepository) : super(MainInitial()) {
    on<FingerPrintEvent>((event, emit)async {
      final bool canAuth = await event.auth.canCheckBiometrics;
      if (canAuth) {
        try{
          final bool finger = await event.auth.authenticate(
              localizedReason: "Qolni bosing oka",
              options: const AuthenticationOptions(
                biometricOnly: false,
              )
          );
          if(finger){
            emit(FingerPrintSuccessState());
          }
          else{
            emit(ErrorState());
          }
        }
        catch(e){
          print(e);
        }
      }
    });
  }
}

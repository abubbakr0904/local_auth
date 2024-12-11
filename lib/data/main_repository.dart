import 'package:local_auth/local_auth.dart';

class MainRepository {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    return await auth.canCheckBiometrics;
  }
}

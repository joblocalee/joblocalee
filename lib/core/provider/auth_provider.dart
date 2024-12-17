import 'dart:developer';

import 'package:injectable/injectable.dart';

import 'base/base_provider.dart';
import '../../utils/helper/error_manager.dart';
import '../service/auth/auth_services.dart';

@lazySingleton
class AuthProvider extends BaseProvider {
  final AuthServices _authServices;
  final ErrorManager _errorManager;

  AuthProvider(this._authServices, this._errorManager,);

  Future<bool> login({required String email, required String passWord}) async {
    try {
      setViewBusy();
      final user = await _authServices.login(
        email: email,
        passWord: passWord,
      );

      log(user.toString(), name: 'User');
      return true;
    }catch (e, s){
      _errorManager.analyticsLog(
        name: 'Login',
        e: e,
        s: s,
      );
    }finally{
      setViewIdeal();
    }
    return false;
  }
}

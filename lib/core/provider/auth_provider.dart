import 'dart:developer';

import 'package:injectable/injectable.dart';

import 'base/base_provider.dart';
import '../../utils/helper/error_manager.dart';
import '../service/auth/auth_service.dart';

@lazySingleton
class AuthProvider extends BaseProvider {
  final AuthServices _authServices;
  final ErrorManager _errorManager;

  AuthProvider(
    this._authServices,
    this._errorManager,
  );

  Future<bool> login({
    required String email,
    required String passWord,
  }) async {
    try {
      setViewBusy();
      final user = await _authServices.login(
        email: email,
        passWord: passWord,
      );

      log(user.toString(), name: 'User');
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(
        name: 'Login',
        e: e,
        s: s,
      );
    } finally {
      setViewIdeal();
    }
    return false;
  }

  Future<bool> registration({
    required String email,
    required String name,
    required String passWord,
    required String phoneNumber,
  }) async {
    try {
      setViewBusy();
      final user = await _authServices.registration(
        email: email,
        name: name,
        passWord: passWord,
        phoneNumber: phoneNumber,
      );

      log(user.toString(), name: 'User');
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(
        name: 'Registration',
        e: e,
        s: s,
      );
    } finally {
      setViewIdeal();
    }
    return false;
  }

  Future<bool> logout() async {
    try {
      setViewBusy();

      log('Logout', name: 'User');
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(
        name: 'Logout',
        e: e,
        s: s,
      );
    } finally   {
      setViewIdeal();
    }
    return false;
  }

  Future<bool> editProfile({
    required String email,
    required String name,
    required String phoneNumber,
    required String address,
    required String locality,
    required String education,
    required String gender,
    required String languages,
  }) async {
    try {
      setViewBusy();
      final user = await _authServices.editProfile(
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        address: address,
        locality: locality,
        education: education,
        gender: gender,
        languages: languages,
      );

      log(user.toString(), name: 'User');
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(
        name: 'Edit-Profile',
        e: e,
        s: s,
      );
    } finally {
      setViewIdeal();
    }
    return false;
  }
}

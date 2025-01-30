import 'package:injectable/injectable.dart';

import '../../utils/helper/error_manager.dart';
import '../../utils/snack_bar/snack_bar_alert.dart';
import '../model/user/user_model.dart';
import '../repository/settings_repository.dart';
import '../repository/user_repository.dart';
import '../routes/app_router.dart';
import '../routes/app_router.gr.dart';
import '../service/auth/auth_service.dart';
import 'base/base_provider.dart';

@lazySingleton
class AuthProvider extends BaseProvider {
  final AuthServices _authServices;
  final ErrorManager _errorManager;
  final SettingsRepository _settingsRepository;
  final SnackBarAlert _snackBarAlert;
  final UserRepository _userRepository;
  final AppRouter _appRouter;

  AuthProvider(
      this._authServices,
      this._errorManager,
      this._snackBarAlert,
      this._userRepository,
      this._appRouter,
      this._settingsRepository,
      );

  UserModel? _user;

  UserModel? get user {
    _user ??= _userRepository.user;
    if (_user == null) {
      logout();
      return null;
    }
    return _user;
  }

  Future<bool> login({required String email, required String passWord}) async {
    try {
      setViewBusy();
      final response = await _authServices.login(
        email: email,
        passWord: passWord,
      );

      _userRepository.save(response.user);
      _settingsRepository.saveToken(response.token);
      _user = response.user;

      _snackBarAlert.showToast(message: 'Login Successful');
      start();
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(name: 'Login', e: e, s: s);
    } finally {
      setViewIdeal();
    }
    return false;
  }

  Future<bool> register({
    required String email,
    required String passWord,
    required String phoneNumber,
    required String name,
  }) async {
    try {
      setViewBusy();
      await _authServices.register(
        email: email,
        passWord: passWord,
        name: name,
        phoneNumber: phoneNumber,
      );

      // log(user.toString(), name: 'User');
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(name: 'Register', e: e, s: s);
    } finally {
      setViewIdeal();
    }
    return false;
  }

  Future<void> logout() async {
    await _userRepository.reset();
    await _settingsRepository.reset();
    start();
  }

  Future<void> unAuthenticatedLogout() async {
    if (_settingsRepository.settings.isLoggedIn) {
      await logout();
    }
  }

  void start() {
    if (!_settingsRepository.settings.isLoggedIn) {
      _appRouter.replaceAll([const LoginRoute()]);
    } else {
      _user = _userRepository.user;
      _appRouter.replaceAll([const HomeRoute()]);
    }
  }
}

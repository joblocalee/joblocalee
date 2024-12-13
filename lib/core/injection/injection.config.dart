// GENERATED CODE - DO NOT MODIFY BY HAND
// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:jus/core/injection/injection.dart' as _i673;
import 'package:jus/core/routes/app_router.dart' as _i348;
import 'package:jus/utils/snack_bar/snack_bar_alert.dart' as _i274;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i348.AppRouter>(() => registerModule.instance);
    gh.lazySingleton<_i274.SnackBarAlert>(() => _i274.SnackBarAlert());
    return this;
  }
}

class _$RegisterModule extends _i673.RegisterModule {}

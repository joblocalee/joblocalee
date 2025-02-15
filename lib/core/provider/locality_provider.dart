import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../service/locality/locality_service.dart';
import '../../utils/helper/error_manager.dart';
import 'base/base_provider.dart';

@injectable
class LocalityProvider extends BaseProvider {
  final LocalityService _localityService;
  final ErrorManager _errorManager;

  LocalityProvider(
    this._localityService,
    this._errorManager,
  );

  Future<bool> getLocality() async {
    try {
      setViewBusy();
      final locality = await _localityService.getLocality();

      log(locality.toString(), name: 'Locality');
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(
        name: 'Locality',
        e: e,
        s: s,
      );
    }finally{
      setViewIdeal();
    }
    return false;
  }
}

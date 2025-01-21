import 'dart:developer';

import 'package:injectable/injectable.dart';

import 'base/base_provider.dart';
import '../../utils/helper/error_manager.dart';
import '../service/vacancy/vacancy_service.dart';

@lazySingleton
class VacancyProvider extends BaseProvider {
  final VacancyService _vacancyService;
  final ErrorManager _errorManager;

  VacancyProvider(
    this._vacancyService,
    this._errorManager,
  );

  Future<bool> getVacancy({
    required String title,
    required String thumbnail,
    required String description,
  }) async {
    try {
      setViewBusy();
      final vacancy = await _vacancyService.getVacancy(
        title: title,
        thumbnail: thumbnail,
        description: description,
      );

      log(vacancy.toString(), name: 'Vacancy');
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(
        name: 'Vacancy',
        e: e,
        s: s,
      );
    } finally {
      setViewIdeal();
    }
    return false;
  }
}

import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../model/vacancy/vacancy_model.dart';
import 'base/base_provider.dart';
import '../../utils/helper/error_manager.dart';
import '../service/vacancy/vacancy_service.dart';

@injectable
class VacancyProvider extends BaseProvider {
  final VacancyService _vacancyService;
  final ErrorManager _errorManager;

  VacancyProvider(
    this._vacancyService,
    this._errorManager,
  );

  List<VacancyModel> _vacancies = [];

  List<VacancyModel> get vacancies => _vacancies;

  Future<bool> getVacancy({
    String? positionName,
    String? jobDescription,
    String? qualification,
    String? experience,
    String? contact,
    String? salary,
    String? timing,
    String? search,
  }) async {
    try {
      setViewBusy();
      final response = await _vacancyService.getVacancy(
        positionName: positionName,
        salary: salary,
        timing: timing,
        search: search,
        jobDescription: jobDescription,
        qualification: qualification,
        experience: experience,
        contact: contact,
      );
      _vacancies = response.vacancy;

      log(_vacancies.toString(), name: 'Vacancy');
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

@injectable
class ApplyProvider extends BaseProvider {
  final VacancyService _vacancyService;
  final ErrorManager _errorManager;

  ApplyProvider(
    this._vacancyService,
    this._errorManager,
  );

  Future<bool> apply({
    required String id,
    required String sId,
  }) async {
    try {
      setViewBusy();
      await _vacancyService.apply(
        id: id,
        sId: sId,
      );
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(name: 'Apply', e: e, s: s);
    } finally {
      setViewIdeal();
    }

    return false;
  }
}

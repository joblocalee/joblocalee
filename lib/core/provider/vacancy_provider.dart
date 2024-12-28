import 'dart:developer';

import 'package:injectable/injectable.dart';

import 'base/base_provider.dart';
import '../../utils/helper/error_manager.dart';
import '../service/vacancy/vacancy_services.dart';

@lazySingleton
class VacancyProvider extends BaseProvider{
  final VacancyServices _vacancyServices;
  final ErrorManager _errorManager;

  VacancyProvider(this._vacancyServices, this._errorManager);

  Future<bool> getVacancy() async {
    try{
      setViewBusy();
      final vacancy = await _vacancyServices.getVacancy(

      );

    }catch (e,s){
      _errorManager.analyticsLog(
        name: 'Vacancy',
        e:e,
        s:s,
      );
    }finally{
      setViewIdeal();
    }
    return false;
  }
}
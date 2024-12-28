import 'dart:isolate';

import 'package:injectable/injectable.dart';
import 'package:jus/core/service/vacancy/vacancy_service_dto.dart';

import '../../../utils/helper/response_helper.dart';
import '../../networking/api.dart';

@injectable
class VacancyServices{
  final Api _api;

  VacancyServices(this._api);

  Future<VacancyServiceDto> getVacancy() async {
    final response = await _api.httpGet(

      endPath: 'https://dummyjson.com/vacancy',
    );

    return Isolate.run(
          () {
        final Map<String, dynamic> responseData =
        ResponseChecker.getSuccessData(
          response: response,
        );

        return VacancyServiceDto.fromJson(responseData);
      },
    );
  }
}
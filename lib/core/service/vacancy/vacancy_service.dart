import 'dart:isolate';

import 'package:injectable/injectable.dart';

import 'vacancy_service_dto.dart';
import '../../../utils/helper/response_helper.dart';
import '../../networking/api.dart';

@injectable
class VacancyService{
  final Api _api;

  VacancyService(this._api);

  Future<VacancyServiceDto> getVacancy({
    required String title,
    required String thumbnail,
    required String description,
  }) async {
    final response = await _api.httpGet(
      endPath: 'https://dummyjson.com/vacancy',
      query: {
        'title': title,
        'thumbnail': thumbnail,
        'description': description,
      }
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

  Future<VacancyServiceDto> jobDescription
  () async {
    final response = await _api.httpGet(
      endPath: '',
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

  Future<VacancyServiceDto> getAppliedJobs() async {
    final response = await _api.httpGet(
        endPath: '',
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

  Future<VacancyServiceDto> apply() async {
    final response = await _api.httpGet(
      endPath: '',
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
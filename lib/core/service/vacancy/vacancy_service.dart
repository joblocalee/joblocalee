import 'dart:isolate';

import 'package:injectable/injectable.dart';

import 'vacancy_service_dto.dart';
import '../../../utils/helper/response_helper.dart';
import '../../networking/api.dart';

@injectable
class VacancyService {
  final Api _api;

  VacancyService(this._api);

  Future<VacancyServiceDto> getVacancy({
    required String? positionName,
    required String? salary,
    required String? timing,
    required String? search,
    required String? jobDescription,
    required String? qualification,
    required String? experience,
    required String? contact,
  }) async {
    final response = await _api.httpGet(endPath: 'vacancies/all', query: {
      if (search != null) 'search': search,
      if (positionName != null) 'positionName': positionName,
      if (salary != null) 'salary': salary,
      if (jobDescription != null) 'salary': jobDescription,
      if (qualification != null) 'salary': qualification,
      if (experience != null) 'salary': experience,
      if (contact != null) 'salary': contact,
      if (timing != null) 'timing': timing,
    });

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

  Future<VacancyServiceDto> jobDescription() async {
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

  Future<void> apply({
    required String id,
    required String sId,
  }) async {
    await _api.httpPost(
      endPath: 'appliedJob/request',
      body: {
        'vacancyId': id,
        'shopId': sId
      },
    );

    return ;
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
}

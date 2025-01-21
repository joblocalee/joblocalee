import 'dart:isolate';

import 'package:injectable/injectable.dart';

import '../../../utils/helper/response_helper.dart';
import '../../networking/api.dart';
import 'locality_service_dto.dart';

@injectable
class LocalityService {
  final Api _api;

  LocalityService(this._api);

  Future<LocalityServiceDto> getLocality() async {
    final response = await _api.httpGet(
      endPath: '',
    );

    return Isolate.run(
      () {
        final Map<String, dynamic> responseData =
            ResponseChecker.getSuccessData(
          response: response,
        );

        return LocalityServiceDto.fromJson(responseData);
      },
    );
  }
}

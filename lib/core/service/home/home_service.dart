import 'dart:isolate';
import 'package:injectable/injectable.dart';

import '../../../utils/helper/response_helper.dart';
import '../../networking/api.dart';
import 'home_service_dto.dart';

@injectable
class HomeService {
  final Api _api;

  HomeService(this._api);

  Future<GetHomeResponseDto> getHome() async {
    final response = await _api.httpGet(
      endPath: '',
    );

    return Isolate.run(
          () {
        final Map<String, dynamic> responseData =
        ResponseChecker.getSuccessData(
          response: response,
        );

        return GetHomeResponseDto.fromJson(responseData);
      },
    );
  }
}

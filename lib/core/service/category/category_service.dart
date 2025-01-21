import 'dart:isolate';

import 'package:injectable/injectable.dart';

import 'category_service_dto.dart';
import '../../../utils/helper/response_helper.dart';
import '../../networking/api.dart';

@injectable
class CategoryService {
  final Api _api;

  CategoryService(this._api);

  Future<CategoryServiceDto> getCategory() async {
    final response = await _api.httpGet(
      endPath: '',
    );

    return Isolate.run(
      () {
        final Map<String, dynamic> responseData =
            ResponseChecker.getSuccessData(
          response: response,
        );

        return CategoryServiceDto.fromJson(responseData);
      },
    );
  }
}

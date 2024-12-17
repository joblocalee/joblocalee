import 'dart:isolate';

import 'package:injectable/injectable.dart';

import '../../model/user/user_model.dart';
import '../../networking/api.dart';
import '../../../utils/helper/response_helper.dart';

@injectable
class AuthServices {
  final Api _api;

  AuthServices(this._api);

  Future<UserModel> login(
      {required String email, required String passWord}) async {
    final response = await _api.httpPost(

      endPath: '',
      body: {
        'email': email,
        'passWord': passWord,
      },
    );

    return Isolate.run(
          () {
            final Map<String, dynamic> responseData =
              ResponseChecker.getSuccessData(
                response: response,
              );

            return UserModel.fromJson(responseData);
          },
    );
  }
}
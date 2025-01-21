import 'dart:isolate';

import 'package:injectable/injectable.dart';

import '../../model/user/user_model.dart';
import '../../networking/api.dart';
import '../../../utils/helper/response_helper.dart';

@injectable
class AuthServices {
  final Api _api;

  AuthServices(this._api);

  Future<UserModel> login({
    required String email,
    required String passWord,
  }) async {
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

  Future<UserModel> registration(
      {required String email,
      required String name,
      required String passWord,
      required String phoneNumber}) async {
    final response = await _api.httpPost(
      endPath: 'users/register',
      body: {
        'email_id': email,
        'userName': name,
        'passWord': passWord,
        'contactNumber': phoneNumber,
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

  Future<UserModel> editProfile({
    required String email,
    required String name,
    required String phoneNumber,
    required String address,
    required String locality,
    required String education,
    required String gender,
    required String languages,
  }) async {
    final response = await _api.httpPost(
      endPath: 'users/editProfile',
      body: {
        'email_id': email,
        'userName': name,
        'contactNumber': phoneNumber,
        'address': address,
        'locality': locality,
        'gender': gender,
        'education': education,
        'languages': languages,
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

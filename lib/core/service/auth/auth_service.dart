import 'dart:isolate';

import 'package:injectable/injectable.dart';

import '../../model/user/user_model.dart';
import '../../networking/api.dart';
import '../../../utils/helper/response_helper.dart';
import 'user_service_dto.dart';

@injectable
class AuthServices {
  final Api _api;

  AuthServices(this._api);

  Future<UserServiceDto> login({
    required String email,
    required String passWord,
  }) async {
    final response = await _api.httpPost(
      endPath: 'users/login',
      body: {
        'email': email,
        'password': passWord,
      },
    );

    return Isolate.run(
      () {
        final Map<String, dynamic> responseData =
            ResponseChecker.getSuccessData(
          response: response,
        );

        // final Map<String, dynamic> responseData = _login;

        return UserServiceDto.fromJson(responseData);
      },
    );
  }

  Future<void> register({
    required String email,
    required String name,
    required String passWord,
    required String phoneNumber,
  }) async {
    await _api.httpPost(
      endPath: 'users/register',
      body: {
        'email_id': email,
        'userName': name,
        'password': passWord,
        'contactNumber': phoneNumber,
      },
    );

    return ;
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

final _login = {
  "success": true,
  "message": "Login successful",
  "data": {
    "user": {
      "_id": "679df1e3777df3b42966ab08",
      "name": "Lazim Nihal",
      "email": "lazimnihal@gmail.com",
      "phone": 9876543210
    },
    "accessToken":
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzlkZjFlMzc3N2RmM2I0Mjk2NmFiMDgiLCJpYXQiOjE3Mzg5NTI4MzMsImV4cCI6MTczOTU1NzYzM30.fLUUEkkb07r1rzrOsFanu6YjkEMHxZLr8U2h2bobLtk"
  }
};
import 'dart:convert';
import 'dart:core';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:missing_finder1/data/api/api_constants.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/data/model/request/RegisterRequest.dart';
import 'package:missing_finder1/data/model/response/ActivateAccountResponseDto.dart';
import 'package:missing_finder1/data/model/response/RegisterResponseDto.dart';
import 'package:missing_finder1/utils/shared_preferences_utils.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<BaseError, RegisterResponseDto>> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String dateOfBirth,
      String gender) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
      var requestBody = RegisterRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        dateOfBirth: dateOfBirth,
        gender: gender,
      );
      print("Request Body => ${requestBody.dateOfBirth}");
      var response = await http.post(
          Uri.parse('https://render-missing-finder.onrender.com/auth/register'),
          body: requestBody.toJson());

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var registerResponse =
            RegisterResponseDto.fromJson(jsonDecode(response.body));
        print("statusCode=>${response.statusCode}");
        print('registerResponse=>${registerResponse.tokenActivateAccount}');
        SharedPreferencesUtils.saveData(
            key: 'token',
            value: jsonEncode(registerResponse.tokenActivateAccount));
        return Right(registerResponse);
      } else {
        return Left(BaseError(errorMessage: response.body));
      }
    } else {
      return Left(BaseError(errorMessage: "check internet connection"));
    }
  }

  Future<Either<BaseError, ActivateAccountResponseDto>> activateAccount(
      String activationCode) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiConstants.baseUrl, ApiConstants.activateAccountApi);
      String token = SharedPreferencesUtils.getData('token').toString();
      var response = await http.post(url, body: {
        "activationCode": activationCode,
      }, headers: {
        'token': token,
      });

      var activateAccountResponse =
          ActivateAccountResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(activateAccountResponse);
      } else {
        return Left(BaseError(
            errorMessage: activateAccountResponse.error != null
                ? activateAccountResponse.error!.msg!
                : activateAccountResponse.message));
      }
    } else {
      return Left(BaseError(errorMessage: "check internet connection"));
    }
  }
}

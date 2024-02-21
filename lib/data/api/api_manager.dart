import 'dart:convert';
import 'dart:core';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:missing_finder1/data/api/api_constants.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/data/model/response/ActivateAccountResponseDto.dart';
import 'package:missing_finder1/data/model/response/ReconfirmResponseDto.dart';
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
      {required Map<String,dynamic> registerParameters}) async {
    Map<String, String>? userHeader = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      print("Request Body => $registerParameters");
      var response = await http.post(
          Uri.parse("${ApiConstants.baseUrl}${ApiConstants.registerApi}"),
          body: jsonEncode(registerParameters),
          headers: userHeader);
      print("statusCode=>${response.statusCode}");

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("JSon => ${jsonResponse}");
        print("JSon => ${response.reasonPhrase}");
        var registerResponse = RegisterResponseDto.fromJson(jsonResponse);
        print("statusCode=>${response.statusCode}");
        print('registerResponse=>${registerResponse.tokenActivateAccount}');
        await SharedPreferencesUtils.saveData(
            key: 'token', value: registerResponse.tokenActivateAccount);
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
      String token = SharedPreferencesUtils.getData('token').toString();
      var response = await http.post(
          Uri.parse(
              "${ApiConstants.baseUrl}${ApiConstants.activateAccountApi}"),
          body: {
            "activationCode": activationCode,
          },
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            'token': token,
          });

      var activateAccountResponse =
          ActivateAccountResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("JSon => ${jsonResponse}");
        print("statusCode=>${response.statusCode}");
        return Right(activateAccountResponse);
      } else {
        return Left(BaseError(errorMessage: response.body));
      }
    } else {
      return Left(BaseError(errorMessage: "check internet connection"));
    }
  }

  Future<Either<BaseError, ReconfirmResponseDto>> reconfirmAccount() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String token = SharedPreferencesUtils.getData('token').toString();
      var response = await http.post(
          Uri.parse(
              "${ApiConstants.baseUrl}${ApiConstants.reconfirmAccountApi}"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
            'token': token,
          });
      var reconfirmAccountResponse =
          ReconfirmResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("JSon => ${jsonResponse}");
        return Right(reconfirmAccountResponse);
      } else {
        return Left(BaseError(errorMessage: response.body));
      }
    } else {
      return Left(BaseError(errorMessage: "check internet connection"));
    }
  }
}

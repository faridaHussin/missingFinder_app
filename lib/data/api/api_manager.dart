import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:missing_finder1/data/api/api_constants.dart';

class ApiManager {
  register(
      String firstName,
      String lastName,
      File personalIdCard,
      String email,
      String password,
      String confirmPassword,
      DateTime dateOfBirth,
      String gender) {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);

    http.post(url);
  }
}

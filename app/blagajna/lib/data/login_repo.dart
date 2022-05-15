import 'dart:io';

import 'package:blagajna/data/url_constants.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  Future<bool> loginUser(String username, String password) async {
    Map<String, String> body = {
      'username': username,
      'password': password,
    };

    try {
      await Dio().post(UrlConstants.baseUrl + UrlConstants.loginUrl,
          data: body,
          options: Options(
            contentType: "application/json",
          ));
      return true;
    } catch (e) {
      return false;
    }
  }
}

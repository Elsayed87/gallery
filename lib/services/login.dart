import 'dart:convert';

import 'package:flutter_gallery/models/user_model.dart';
import 'package:http/http.dart' as http;

const Url = 'https://technichal.prominaagency.com/api/auth/login';

class LoginApi {
  Future<UserDataModel> userLogin(String email, String password) async {
    late UserDataModel user;
    var response = await http
        .post(Uri.parse(Url), body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      user = UserDataModel.fromJson(json);
    } else {
      print('the error eas in ${response.statusCode}');
    }
    //  print(user.token.toString());
    return user;
  }
}

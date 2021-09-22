import 'package:flutter_apptest/api/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_apptest/model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
 
    final response = await http.post(Uri.parse(AppUrl.loginUrl), body: requestModel.toJson());
    print("response");
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
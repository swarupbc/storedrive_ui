import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storedrive_ui/model/userModel.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = 'https://api.samriddhisolutions.in/vconnect/rds/login.php';

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('faild to load data');
    }
  }
}

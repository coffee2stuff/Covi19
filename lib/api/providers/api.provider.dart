import 'dart:convert';

import 'package:covi_19/utils/constants/api.const.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static final ApiProvider instance = ApiProvider._internal();

  ApiProvider._internal();

  Future<dynamic> createGetRequest(String endpoint) async {
    final res = await http.get(BASE_URL + endpoint);
    return jsonDecode(res.body);
  }
}

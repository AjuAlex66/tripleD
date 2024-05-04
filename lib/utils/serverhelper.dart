import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ServerHelper {
  static Future<dynamic> get(String url) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", "x-auth-token": ""},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        var error = {
          "status": false,
          "msg": "${response.statusCode} - ${response.reasonPhrase}"
        };
        return error;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}

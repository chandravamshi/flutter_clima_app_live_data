import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
    } catch (e) {
      //
      rethrow;
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    final response = await http.get(
      Uri.parse(url),
    );

    String data = response.body;

    if (response.statusCode == 200) {
      return data;
    } else {
      print(response.statusCode);
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jar_of_heart_views/urls.dart';

Future<Map> getJar({required String id}) async {
  try {
    Uri url = Uri.parse("${AppUrls.baseUrl}/retrieve_jar");

    http.Response response = await http
        .post(
          url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"jar_id": id}),
        )
        .timeout(const Duration(seconds: 60));

    Map data = json.decode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw StringException(data['message']);
    }
  } on TimeoutException {
    throw StringException('Request timed out. Please try again');
  } on SocketException {
    throw StringException('Please check your internet connection');
  }
}

class StringException implements Exception {
  String error;
  StringException(this.error);

  @override
  String toString() {
    // TODO: implement toString
    return error;
  }
}

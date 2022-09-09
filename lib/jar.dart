import 'package:flutter/material.dart';

import 'package:jar_of_heart_views/get_jar.dart';

class JarController {
  static var currentJar = {};
  static var currentIndex = 0;

  static Future<bool> viewJar(BuildContext context, String id) async {
    try {
      currentJar = (await getJar(id: id))['jar'];

      return true;
    } on StringException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
      rethrow;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
      rethrow;
    }
  }
}

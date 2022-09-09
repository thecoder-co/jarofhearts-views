import 'package:flutter/material.dart';
import 'package:jar_of_heart_views/dialogs.dart';
import 'package:jar_of_heart_views/get_jar.dart';

class JarController {
  static var currentJar = {};
  static var currentIndex = 0;

  static Future<bool> viewJar(BuildContext context, String id) async {
    Dialogs.loadDialog(context);
    try {
      currentJar = (await getJar(id: id))['jar'];

      Navigator.of(context).pop();
      return true;
    } on StringException catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
      rethrow;
    } catch (e) {
      Navigator.of(context).pop();
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

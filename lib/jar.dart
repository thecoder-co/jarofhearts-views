import 'package:flutter/material.dart';

import 'package:jar_of_heart_views/get_jar.dart';

class JarController {
  static Map currentJar = {
    "_id": "631bbd37d6b5fca386d7ccaf",
    "bgCardBorderGradient": [4281601328, 4280162136],
    "bgColor": null,
    "bgGradient": null,
    "bgImage":
        "https://res.cloudinary.com/dahba1joi/image/upload/v1662762518/ah0an0ncshhlislxy0to.jpg",
    "cardBgColor": null,
    "cardBgGradient": [4281149274, 4282584894],
    "cardBgImage": null,
    "name":
        "Cute cat pictures historically makes you feel better... I hope it works",
    "pages": [
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764009/vk3go3efvyu0e5i7yunw.jpg",
        "text": "muah"
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764043/pka54d1oykakywermj7u.jpg",
        "text": "pov me with you"
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764072/bw2w5wxmzrud19hymzbk.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764103/rdszbgvyz3qztidzik2c.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764610/qg9hmz0b3vsitgvbk4d1.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764652/iftfb07w5xqriqs01cmw.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764663/zmn4gwgqckwbz4vl1nu1.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764674/lpcwfxweeshyzljalavj.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764678/j1lln9m9nk5p1adzi5lv.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764703/kqnd4adkvmdnmtj73l2n.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764736/u8dyhrqzhnohtvepzinb.jpg",
        "text": ""
      },
      {
        "image":
            "https://res.cloudinary.com/dahba1joi/image/upload/v1662764722/hemlxtmwrsfqt5agjk67.jpg",
        "text": ""
      },
      {"text": "Feeling better yet?"},
      {"text": "I love youu!!!!"}
    ],
    "sound":
        "https://res.cloudinary.com/dahba1joi/video/upload/v1662763252/jodrcvg2siyfjrcwrrso.mp3"
  };

  static String? jar;
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

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:jar_of_heart_views/audio_controller.dart';

import 'package:jar_of_heart_views/jar.dart';

class PreviewSecondScreen extends StatefulWidget {
  const PreviewSecondScreen({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<PreviewSecondScreen> {
  Color? bgColor;
  List<Color>? bgGradient;
  String? bgImage;

  Color? cardBgColor;
  List<Color>? cardBgGradient;
  String? cardBgImage;

  List<Color>? cardBorderBgGradient;
  @override
  void initState() {
    try {
      if (JarController.currentJar['pages']?[0]?['sound'] != null) {
        AudioController.secondPlayer.stop();
        AudioController.secondPlayer
            .play(UrlSource(JarController.currentJar['pages']?[0]?['sound']));
      }
    } catch (e) {
      // TODO
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Builder(builder: (context) {
        if (JarController.currentJar['bgColor'] != null) {
          bgColor = Color(JarController.currentJar['bgColor']);
        } else {
          bgColor = null;
        }
        if (JarController.currentJar['bgGradient'] != null) {
          List gradient = JarController.currentJar['bgGradient'];
          bgGradient = gradient.map((e) => Color(e)).toList();
        } else {
          bgGradient = null;
        }
        if (JarController.currentJar['bgImage'] != null) {
          bgImage = JarController.currentJar['bgImage'];
        } else {
          bgImage = null;
        }

        /// CARD

        if (JarController.currentJar['cardBgColor'] != null) {
          cardBgColor = Color(JarController.currentJar['cardBgColor']);
        } else {
          cardBgColor = null;
        }

        if (JarController.currentJar['cardBgGradient'] != null) {
          ///  print('GRADEDDD');
          List gradient = JarController.currentJar['cardBgGradient'];
          cardBgGradient = gradient.map((e) => Color(e)).toList();
        } else {
          cardBgGradient = null;
        }

        if (JarController.currentJar['bgCardBorderGradient'] != null) {
          List gradient = JarController.currentJar['bgCardBorderGradient'];
          cardBorderBgGradient = gradient.map((e) => Color(e)).toList();
        } else {
          cardBorderBgGradient = null;
        }
        if (JarController.currentJar['cardBgImage'] != null) {
          cardBgImage = JarController.currentJar['cardBgImage'];
        } else {
          cardBgImage = null;
        }
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: bgGradient != null
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: bgGradient!,
                  )
                : null,
            color: bgColor,
            image: bgImage != null
                ? DecorationImage(
                    image: NetworkImage(bgImage!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: Swiper(
            itemCount: JarController.currentJar['pages'].length,
            autoplay: false,
            loop: false,
            control: const SwiperControl(),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            index: JarController.currentIndex,
            onIndexChanged: (i) {
              JarController.currentIndex = i;

              try {
                AudioController.secondPlayer.stop();
                AudioController.secondPlayer.play(
                    UrlSource(JarController.currentJar['pages']?[i]?['sound']));
              } catch (e) {
                // TODO
              }
            },
            scale: 0.8,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(30),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.10,
                  bottom: MediaQuery.of(context).size.height * 0.10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: cardBorderBgGradient != null
                      ? GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: cardBorderBgGradient!,
                          ),
                          width: 3,
                        )
                      : null,
                  gradient: cardBgGradient != null
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: cardBgGradient!,
                        )
                      : null,
                  color: cardBgColor,
                  image: JarController.currentJar['pages']?[index]?['image'] !=
                          null
                      ? DecorationImage(
                          image: NetworkImage(JarController.currentJar['pages']
                              [index]['image']),
                          fit: BoxFit.cover,
                        )
                      : cardBgImage != null
                          ? DecorationImage(
                              image: NetworkImage(cardBgImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                ),
                child: Center(
                  child: Text(
                    '${JarController.currentJar['pages']?[index]?['text'] ?? ''}',
                    style: JarController.currentJar['font'] == null
                        ? TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: JarController.currentJar['textColor'] == null
                                ? const Color(0xffA1C6EA)
                                : Color(
                                    JarController.currentJar['textColor'],
                                  ),
                          )
                        : GoogleFonts.getFont(
                            JarController.currentJar['font'],
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: JarController.currentJar['textColor'] == null
                                ? const Color(0xffA1C6EA)
                                : Color(
                                    JarController.currentJar['textColor'],
                                  ),
                          ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

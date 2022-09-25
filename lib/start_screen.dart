import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:jar_of_heart_views/audio_controller.dart';
import 'package:jar_of_heart_views/jar.dart';
import 'package:jar_of_heart_views/second_screen.dart';
import 'package:jar_of_heart_views/size.dart';

class PreviewStart extends StatefulWidget {
  const PreviewStart({Key? key}) : super(key: key);

  @override
  State<PreviewStart> createState() => _EditStartViewState();
}

class _EditStartViewState extends State<PreviewStart> {
  double chgval = 50.0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      paddingSize = WindowSize.width(context) * 0.5 - 70;
      setState(() {});
    });
  }

  double paddingSize = 0;

  Color? bgColor;
  List<Color>? bgGradient;
  String? bgImage;

  Color? cardBgColor;
  List<Color>? cardBgGradient;
  String? cardBgImage;

  List<Color>? cardBorderBgGradient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Builder(builder: (_) {
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

        if (JarController.currentJar['cardBgImage'] != null) {
          cardBgImage = JarController.currentJar['cardBgImage'];
        } else {
          cardBgImage = null;
        }
        if (JarController.currentJar['bgCardBorderGradient'] != null) {
          List gradient = JarController.currentJar['bgCardBorderGradient'];
          cardBorderBgGradient = gradient.map((e) => Color(e)).toList();
        } else {
          cardBorderBgGradient = null;
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
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50.0, bottom: 50.0, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
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
                      image: cardBgImage != null
                          ? DecorationImage(
                              image: NetworkImage(cardBgImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        '${JarController.currentJar['name'] ?? ''}',
                        style: JarController.currentJar['font'] == null
                            ? TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: JarController.currentJar['textColor'] ==
                                        null
                                    ? const Color(0xffA1C6EA)
                                    : Color(
                                        JarController.currentJar['textColor'],
                                      ),
                              )
                            : GoogleFonts.getFont(
                                JarController.currentJar['font'],
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: JarController.currentJar['textColor'] ==
                                        null
                                    ? const Color(0xffA1C6EA)
                                    : Color(
                                        JarController.currentJar['textColor'],
                                      ),
                              ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    if (JarController.currentJar['sound'] != null) {
                      AudioController.player
                          .play(UrlSource(JarController.currentJar['sound']));
                      print('playing');
                    }
                    JarController.currentIndex = 0;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const PreviewSecondScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: cardBgGradient != null
                          ? LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: cardBgGradient!,
                            )
                          : null,
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
                      color: cardBgColor,
                      image: cardBgImage != null
                          ? DecorationImage(
                              image: NetworkImage(cardBgImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: paddingSize),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Start',
                          style: JarController.currentJar['font'] == null
                              ? TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: JarController
                                              .currentJar['textColor'] ==
                                          null
                                      ? const Color(0xffA1C6EA)
                                      : Color(
                                          JarController.currentJar['textColor'],
                                        ),
                                )
                              : GoogleFonts.getFont(
                                  JarController.currentJar['font'],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: JarController
                                              .currentJar['textColor'] ==
                                          null
                                      ? const Color(0xffA1C6EA)
                                      : Color(
                                          JarController.currentJar['textColor'],
                                        ),
                                ),
                        ),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 20, end: chgval),
                          duration: const Duration(milliseconds: 1000),
                          onEnd: () => setState(
                            () {
                              chgval = chgval == 20.0 ? 50.0 : 20.0;
                            },
                          ),
                          builder: (BuildContext context, double size,
                              Widget? child) {
                            return SizedBox(
                              width: size,
                            );
                          },
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: JarController.currentJar['textColor'] == null
                              ? const Color(0xffA1C6EA)
                              : Color(
                                  JarController.currentJar['textColor'],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

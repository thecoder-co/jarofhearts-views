import 'package:flutter/material.dart';
import 'package:jar_of_heart_views/dom_start.dart';
import 'package:jar_of_heart_views/jar.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:jar_of_heart_views/prefs.dart';

void main() async {
  usePathUrlStrategy();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Dys',
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const MyHomePage(),
        '/': (context) => const MyHomePage()
      },
      initialRoute: '/home',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    JarController.jar = Uri.base.queryParameters['jar'];
    JarController.jar ??= Prefs.getId();

    /* if (kDebugMode && JarController.jar == null) {
      print('JarController.jar was null');
      JarController.jar ??= '631b4dfb673f8e63205ef9ab';
    } else {
      print('JarController.jar was not null');
    } */

    if (JarController.jar == null) {
      return const Scaffold(
        body: Center(child: Text('No jar chosen')),
      );
    } else {
      Prefs.saveId(JarController.jar!);
    }

    return Scaffold(
      body: FutureBuilder(
        future: JarController.viewJar(context, JarController.jar!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return const DomStart();
            //return const PreviewStart();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

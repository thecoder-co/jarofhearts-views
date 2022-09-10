import 'package:flutter/material.dart';
import 'package:jar_of_heart_views/dom_start.dart';
import 'package:jar_of_heart_views/jar.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    /* String myurl = Uri.base.toString();

    JarController.jar = Uri.base.queryParameters['jar'];
    print('${JarController.jar} WREGSDFVERV3');
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
    } */

    return const DomStart();
  }
}

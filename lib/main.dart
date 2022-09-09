import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jar_of_heart_views/jar.dart';
import 'package:jar_of_heart_views/start_screen.dart';

void main() {
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;
  String? jar = Uri.base.queryParameters["jar"];

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      jar ??= '631a47337965a1ff4255d566';
    }

    if (jar == null) {
      return const Scaffold(
        body: Center(child: Text('No jar chosen')),
      );
    }

    return Scaffold(
      body: FutureBuilder(
        future: JarController.viewJar(context, jar!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return const PreviewStart();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

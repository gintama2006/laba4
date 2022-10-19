import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ЛАБА 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _counter = false;
  String _cat = "котик";

  void _incrementCounter() {
    setState(() {
      _counter = !_counter;
      if (_counter)
        _cat = "не котик";
      else
        _cat = "котек";

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),

      body: Container(
        color: Colors.greenAccent,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
                child: Text(_cat)
            ),
            Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(onPressed: () async {await launchUrl(Uri.https('github.com','/gintama2006'));},
                  child: const Text("ГИТХАБ"))),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(onPressed: () async {await launchUrl(Uri.https('smolgu.ru'));},
                  child: Text("сайт Смолгу"))),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(onPressed: _incrementCounter, icon: const Image(image: AssetImage('image/123.png')), iconSize: 300,
              ),
            ),
          ],
        ),
      ),

    );
  }
}

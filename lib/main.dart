import 'package:flutter/material.dart';
import 'package:flutter_incubator_test/1_dart_concepts/1_1_mixins/task_1.dart';

import '1_dart_concepts/1_1_mixins/task_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Incubator Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Incubator Tasks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createInkWell(customTag("1_1_mixins Task_1"), () {
              navigateScreens(context, Task1());
            }),
            needSpace(20, "h"),
            createInkWell(customTag("1_1_mixins Task_2"), () {
              navigateScreens(context, Task2());
            }),
            needSpace(20, "h"),
            createInkWell(customTag("1_1_mixins Task_3"), () {
              navigateScreens(context, Task1());
            }),
          ],
        ),
      ),
    );
  }
}

createInkWell(button, onCall) {
  return InkWell(onTap: onCall, child: button);
}

Widget customTag(String text, {Color? textColor}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey[900], // dark background
      borderRadius: BorderRadius.circular(12), // rounded corners
    ),
    child: Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.white, // white text
        fontSize: 16,
      ),
    ),
  );
}

navigateScreens(context, destination) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
}

needSpace(space, direction) {
  if (direction == "h") {
    return SizedBox(height: space);
  } else {
    return SizedBox(width: space);
  }
}

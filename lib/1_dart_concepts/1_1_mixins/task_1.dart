import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  String datetime = "Tap on Show Date";

  @override
  Widget build(BuildContext context) {
    DateTime dtTime = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Task 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            customTag(datetime),
            needSpace(150, "h"),
            createInkWell(customTag("Show Date"), () {
              datetime = "Normal Date-> ${dtTime.toString()}";
              setState(() {});
            }),
            needSpace(20, "h"),
            createInkWell(customTag("Extension Method"), () {
              datetime = "Extension Date-> ${dtTime.toYMD()}";
              setState(() {});
            }),
          ],
        ),
      ),
    );
  }
}

extension Task1ExtensionMethod on DateTime {
  String toYMD() {
    final formatter = DateFormat("yyyy.MM.dd HH:mm:ss");
    return formatter.format(this);
  }
}

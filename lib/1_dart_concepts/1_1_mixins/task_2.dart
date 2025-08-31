import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  List<InlineSpan> parsedText = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Task 2"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "Type String with , separate",
                ),
              ),
              needSpace(150, "h"),
              RichText(text: TextSpan(children: parsedText)),
              needSpace(150, "h"),
              createInkWell(customTag("Parsing"), () {
                parsedText =
                    textEditingController.text.toString().parsingLinks();
                setState(() {});
              }),
              needSpace(20, "h"),
            ],
          ),
        ),
      ),
    );
  }
}

extension Task2ExtensionMethod on String {
  List<InlineSpan> parsingLinks() {
    List<String> chunks = this.split(",");
    List<InlineSpan> parsedList = [];
    final RegExp linkRegExp = RegExp(
      r'(https?:\/\/[^\s]+|[a-zA-Z0-9-]+\.[a-zA-Z]{2,})',
      caseSensitive: false,
    );
    chunks.forEach((action) {
      if (linkRegExp.hasMatch(action)) {
        parsedList.add(
          TextSpan(text: action, style: TextStyle(color: Colors.blue)),
        );
      } else {
        parsedList.add(
          TextSpan(text: action, style: TextStyle(color: Colors.black)),
        );
      }
    });
    return parsedList;
  }
}

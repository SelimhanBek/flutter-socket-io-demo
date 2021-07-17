import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'client.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({required this.title});

  void nvgToSocket(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ClientPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => nvgToSocket(context),
          child: Text("Connect to Socket Sever"),
        ),
      ),
    );
  }
}
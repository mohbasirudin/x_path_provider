import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:x_path_provider/x_path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _xPathProvider = XPathProvider();

  @override
  void initState() {
    super.initState();
  }

  void _init() async {
    var path = await _xPathProvider.getAppDirectory();
    print("path: $path");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('X Path Provider'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _init,
            child: const Text("get path"),
          ),
        ),
      ),
    );
  }
}

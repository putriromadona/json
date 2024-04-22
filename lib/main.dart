import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundamental_parsing_json/sample.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  Sample? result;
  // fake menthod for simulation
  Future _loadJsonSample() async {
    String jsonString = await rootBundle.loadString('assets/sample.json');
    //proses mappimg data
    final jsonData = jsonDecode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      result = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fundamental Parsing Json',
      home: Scaffold(
        appBar:AppBar(
          title: const Text('Fundamental Parsing Json'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  _loadJsonSample();
                }, child: const Text(
                  'Read JSON data', 
                ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '${result?.articles}',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                  ),
            ],
          ),
        ),
        ),
    );
  }
}
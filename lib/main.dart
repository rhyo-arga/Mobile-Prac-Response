import 'package:flutter/material.dart';
import 'package:mobile_prac_response/views/list_match.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Cup 2022 Qatar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListMatchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
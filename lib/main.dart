import 'package:data_fetch_getx_mvc/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Data Fetch',
      theme: ThemeData(
     
        primarySwatch: Colors.indigo,
      ),
      home:  Homepage(),
    );
  }
}

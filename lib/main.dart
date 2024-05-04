import 'package:flutter/material.dart';
import 'package:student_register/featuers/home/presentation/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner:false ,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const HomeView(),
    );
  }
}

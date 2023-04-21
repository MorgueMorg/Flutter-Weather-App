import 'package:flutter/material.dart';
import 'package:weathersec/views/screens/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      title: "Weather",
      debugShowCheckedModeBanner: false,
    );
  }
}

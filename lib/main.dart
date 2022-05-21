import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'variables/variables.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Variables.statusBarTheme;
  Variables.portraitMood;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: Variables.themeData,
      home: const HomePage(),
    );
  }
}

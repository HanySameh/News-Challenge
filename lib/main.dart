import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/screens/nav_bar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const NavBar(),
    );
  }
}

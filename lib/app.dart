import 'package:flutter/material.dart';

import 'features/home/presentation/view/nav_bar.dart';

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

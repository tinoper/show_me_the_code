import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/core/theme.dart';
import 'package:code_my_screen/home/view/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      theme: appTheme(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.red.shade900,
      //   ),
      //   useMaterial3: true,
      // ),
      home: const HomePage(),
    );
  }
}

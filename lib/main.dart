import 'package:book_shelf_app/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set a custom color or transparent
    statusBarIconBrightness: Brightness.dark, // Choose light or dark icons
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarCustom(),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

import 'package:book_shelf_app/pages/select_books_page/select_books_page.dart';
import 'package:book_shelf_app/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => BooksProvider(),
      )
    ],
    child: const MainApp(),
  ));
  // Set the status bar color and icon brightness before the app starts
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black, // Set a custom color
    statusBarIconBrightness: Brightness.dark, // Choose light or dark icons
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SelectBooksPage(),
      ),
    );
  }
}

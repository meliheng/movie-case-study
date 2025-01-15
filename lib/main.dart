import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_case/core/di/getit_init.dart';
import 'package:movie_case/presentation/screens/movie_list_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  setUp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieListScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:messager_app/features/feed/data/data.dart' as data;
import 'package:messager_app/features/feed/presentation/feed.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: Feed(currentUser: data.user_1),
    );
  }
}

import 'package:flutter/material.dart';
import 'views/task_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
        fontFamily: 'Poppins',
      ),
      home: const TaskListPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/exam_list_screen.dart';
// --- 1. Модел на податоци ---


// --- 2. Главен влез (Main) ---
void main() {
  runApp(const ExamScheduleApp());
}

class ExamScheduleApp extends StatelessWidget {
  const ExamScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред на испити',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardThemeData(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      // Поставете го почетниот екран и проследете го бројот на индекс
      home: ExamListScreen(indexNumber: "223171"),
    );
  }
}

// --- 3. Почетен екран (Листа на испити) ---


// --- 4. Екран за детален преглед ---

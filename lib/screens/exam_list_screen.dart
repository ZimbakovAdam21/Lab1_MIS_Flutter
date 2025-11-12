import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';
import 'exam_detail_screen.dart';
class ExamListScreen extends StatelessWidget {
  final String indexNumber;

  ExamListScreen({super.key, required this.indexNumber});

  final List<Exam> _examList = [
    Exam(subjectName: "Веројатност и статистика", dateTime: DateTime.now().add(const Duration(days: 5, hours: 3)), rooms: ["Амф Машински"]),
    Exam(subjectName: "Веб програмирање", dateTime: DateTime.now().add(const Duration(days: 19, hours: 1)), rooms: ["Б3.2"]),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime.now().add(const Duration(days: 10, hours: 6)), rooms: ["Амф ФИНКИ"]),
    Exam(subjectName: "Софтверско инженерство", dateTime: DateTime.now().add(const Duration(days: 12)), rooms: ["Б2.2"]),
    Exam(subjectName: "Вовед во науката на податоци", dateTime: DateTime.now().add(const Duration(days: 15, hours: 2)), rooms: ["Лаб 3"]),
    Exam(subjectName: "Бизнис и менаџмент", dateTime: DateTime.now().subtract(const Duration(days: 3)), rooms: ["Амф ТМФ"]),
    Exam(subjectName: "Дискретна математика", dateTime: DateTime.now().subtract(const Duration(days: 10)), rooms: ["Лаб 2"]),
    Exam(subjectName: "Вовед во компјутерските науки", dateTime: DateTime.now().subtract(const Duration(days: 5, hours: 4)), rooms: ["Лаб 215"]),
    Exam(subjectName: "Оперативни системи", dateTime: DateTime.now().subtract(const Duration(days: 1)), rooms: ["Б1.1"]),
    Exam(subjectName: "Компјутерски мрежи и безбедност", dateTime: DateTime.now().subtract(const Duration(days: 8)), rooms: ["Лаб 13"]),
  ];

  @override
  Widget build(BuildContext context) {
    _examList.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - $indexNumber"),
      ),
      body: ListView.builder(
        itemCount: _examList.length,
        itemBuilder: (ctx, index) {
          final exam = _examList[index];

          final isPast = exam.dateTime.isBefore(now);
          final cardColor = isPast ? Colors.grey[300] : Colors.white;
          final titleColor = isPast ? Colors.grey[700] : Colors.black;

          final DateFormat dateFormatter = DateFormat('dd.MM.yyyy');
          final DateFormat timeFormatter = DateFormat('HH:mm');
          final String dateString = dateFormatter.format(exam.dateTime);
          final String timeString = timeFormatter.format(exam.dateTime);

          return Card(
            color: cardColor,
            child: InkWell( // Додаваме InkWell за ефект при клик
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamDetailScreen(exam: exam),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam.subjectName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: titleColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16, color: Colors.indigo[700]),
                        const SizedBox(width: 8),
                        Text(dateString),
                        const SizedBox(width: 16),
                        Icon(Icons.access_time, size: 16, color: Colors.indigo[700]),
                        const SizedBox(width: 8),
                        Text(timeString),
                      ],
                    ),
                    const SizedBox(height: 8),
                
                    Row(
                      children: [
                        Icon(Icons.room, size: 16, color: Colors.deepOrange[700]),
                        const SizedBox(width: 8),
                        
                        Expanded(
                          child: Text(
                            exam.rooms.join(", "),
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Вкупно испити: ",
                style: TextStyle(fontSize: 16),
              ),
              Chip(
                label: Text(
                  _examList.length.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.indigo,
              ),
            ],
          ),
        ),
      ),
    );
  }

}

import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'package:intl/intl.dart';
class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  
  const ExamDetailScreen({super.key, required this.exam});

  
  String _getCountdownString(DateTime examTime) {
    final now = DateTime.now();
    final difference = examTime.difference(now);

    
    if (difference.isNegative) {
      return "Испитот е веќе поминат";
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24; 

    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
   
    final DateFormat dateTimeFormatter = DateFormat('dd.MM.yyyy  '' HH:mm');
    final String dateTimeString = dateTimeFormatter.format(exam.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, 
              children: [
                
                Text(
                  exam.subjectName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const Divider(height: 30, thickness: 1),

                
                _buildDetailRow(
                  icon: Icons.calendar_today,
                  title: "Датум и време:",
                  value: dateTimeString,
                ),
                const SizedBox(height: 20),
                _buildDetailRow(
                  icon: Icons.room,
                  title: "Простории:",
                  value: exam.rooms.join(", "),
                ),
                const Divider(height: 30, thickness: 1),

                
                _buildDetailRow(
                  icon: Icons.hourglass_bottom,
                  title: "Преостанува:",
                  value: _getCountdownString(exam.dateTime),
                  valueColor: Colors.red[700],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey[700], size: 22),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: valueColor, /
              ),
            ),
          ],
        ),
      ],
    );
  }

}



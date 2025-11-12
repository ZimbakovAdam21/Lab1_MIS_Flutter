class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;

  // Конструктор со именувани (named) параметри
  const Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
  });
}
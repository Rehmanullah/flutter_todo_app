class TodoModel {
  final String taskName;
  final String date;
  final String category;
  final bool isCompleted;

  const TodoModel({
    required this.taskName,
    required this.date,
    required this.category,
    required this.isCompleted,
  });
}

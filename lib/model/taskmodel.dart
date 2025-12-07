class Taskmodel {
  final String? id;
  final String name;
  final DateTime dueDate;
  final String assignedTo;

  Taskmodel({
    this.id,
    required this.name,
    required this.dueDate,
    required this.assignedTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate.toIso8601String(),
      'assignedTo': assignedTo,
    };
  }

  factory Taskmodel.fromMap(Map<String, dynamic> map, String id) {
    return Taskmodel(
      id: id,
      name: map['name'] ?? '',
      dueDate: DateTime.tryParse(map['dueDate'] ?? '') ?? DateTime.now(),
      assignedTo: map['assignedTo'] ?? '',
    );
  }
}

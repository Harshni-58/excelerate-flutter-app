class Program {
  final int id;
  final String title;
  final String startDate;
  final String description;
  final String schedule;
  final String eligibility;
  final String trainers;
  final List<String> outcomes;

  Program({
    required this.id,
    required this.title,
    required this.startDate,
    required this.description,
    required this.schedule,
    required this.eligibility,
    required this.trainers,
    required this.outcomes,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'] as int,
      title: json['title'] as String,
      startDate: json['startDate'] as String,
      description: json['description'] as String,
      schedule: json['schedule'] as String,
      eligibility: json['eligibility'] as String,
      trainers: json['trainers'] as String,
      outcomes: List<String>.from(json['outcomes'] as List),
    );
  }
}
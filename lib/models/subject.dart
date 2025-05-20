class Subject {
  final String name;
  final String code;
  final double units;
  final String schedule;
  final String day;
  final String room;
  bool isSelected;

  Subject({
    required this.name,
    required this.code,
    required this.units,
    required this.schedule,
    required this.day,
    required this.room,
    this.isSelected = false,
  });
}

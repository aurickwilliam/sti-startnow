class Subject {
  final String name;
  final String code;
  final double units;
  bool isSelected;

  Subject({
    required this.name,
    required this.code,
    required this.units,
    this.isSelected = false,
  });
}
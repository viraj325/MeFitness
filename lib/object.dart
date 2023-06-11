class Exercise {
  String id = DateTime.now().millisecondsSinceEpoch as String;
  int day;
  String name;
  int reps;
  int sets;
  String description;

  Exercise(this.day, this.name, this.reps, this.sets, this.description);
}
class Job {
  late String id;
  late String title;
  late String departm;
  late List<String> requirements;
  late String description;
  late String salary;

  Job(
      {required this.id,
      required this.title,
      required this.departm,
      required this.requirements,
      required this.description,
      required this.salary});

  Job.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    departm = json["departm"];
    requirements = json["requirements"].cast<String>();
    description = json["description"];
    salary = json["salary"];
  }
}

class Job {
  String id;
  String title;
  String departm;
  List<String> requirements;
  String description;
  String salary;

  Job(
      {this.id,
      this.title,
      this.departm,
      this.requirements,
      this.description,
      this.salary});

  Job.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    departm = json["departm"];
    requirements = json["requirements"].cast<String>();
    description = json["description"];
    salary = json["salary"];
  }
}

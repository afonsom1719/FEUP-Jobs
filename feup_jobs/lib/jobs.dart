import 'dart:convert';
import 'package:feup_jobs/json_data.json';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Job {
  final String title;
  final String departm;
  final String description;
  final List<String> requirements;
  final String extra;
  final String id;
  final String salary;

  Job(
      {required this.title,
      required this.departm,
      required this.description,
      required this.id,
      required this.extra,
      required this.requirements,
      required this.salary});
  String getDescription() {
    return this.description;
  }

  String getTitle() {
    return this.title;
  }

  String getExtra() {
    return this.extra;
  }

  String getID() {
    return this.id;
  }

  List<String> getReq() {
    return this.requirements;
  }

  String getDepartment() {
    return this.departm;
  }

  String getSalary() {
    return this.salary;
  }

  factory Job.fromJson(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    final title = data['title'] as String;
    final description = data['description'] as String;
    final id = data['id'] as String;
    final departm = data['departm'] as String;
    final requirements = data['requirements'] as List<String>;
    final extra = data['extra'] as String;
    final salary = data['salary'] as String;

    return Job(
        title: title,
        description: description,
        id: id,
        departm: departm,
        requirements: requirements,
        extra: extra,
        salary: salary);
  }
}

List<Job> createJobs() {
  List<Job> jobsList = [];
  final parsedJson = jsonDecode('package:feup_jobs/json_data.json');
  final jobsMap = parsedJson['jobsJSON'] as List<Map<String, dynamic>>;

  for (Map<String, dynamic> aux in jobsMap) {
    jobsList.add(Job.fromJson(aux));
  }
  print(jobsList);
  return jobsList;
}

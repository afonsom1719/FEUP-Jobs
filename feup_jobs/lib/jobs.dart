import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

class Job {
  late String id;
  late String title;
  late String departm;
  late String requirements;
  late String description;
  late String extra;
  late String salary;

  Job(
      {required this.id,
      required this.title,
      required this.departm,
      required this.requirements,
      required this.description,
      required this.extra,
      required this.salary});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    departm = json['departm'];
    requirements = json['requirements'];
    description = json['description'];
    extra = json['extra'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['departm'] = this.departm;
    data['requirements'] = this.requirements;
    data['description'] = this.description;
    data['extra'] = this.extra;
    data['salary'] = this.salary;
    return data;
  }
}

List<Job> createJobs() {
  Iterable i = json.decode('json_data.json');
  List<Job> jobs = List<Job>.from(i.map((data) => Job.fromJson(data)));

  return jobs;
}

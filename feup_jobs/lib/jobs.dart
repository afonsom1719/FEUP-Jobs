import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

class Job {
  String id = "";
  String title = "";
  String departm = "";
  List<String> requirements = [];
  String description = "";
  String salary = "";

  Job(String id, String title, String departm, List<String> requirements,
      String description, String salary) {
    this.id = id;
    this.title = title;
    this.departm = departm;
    this.requirements = requirements;
    this.description = description;
    this.salary = salary;
  }

  /*Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    departm = json['departm'];
    requirements = json['requirements'];
    description = json['description'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['departm'] = this.departm;
    data['requirements'] = this.requirements;
    data['description'] = this.description;
    data['salary'] = this.salary;
    return data;
  }*/
}

int counter = 0;
List<Job> jobsaux = [];

/*void createJobs() async {
//  List<Job> jobs = [];
  String source = await File("../assets/json_data.json").readAsString();

  Iterable i = json.decode(source.toString());

  List<Job> jobs = List<Job>.from(i.map((data) => Job.fromJson(data)));
  counter = jobs.length;

  jobsaux = jobs;
}*/

List<Job> getjobs() {
  createJobs();
  return jobsaux;
}

int getSize() {
  return counter;
}

List<Job> createJobs() {
  List<Job> jobs = [];
  Job job0 = new Job(
      "0",
      "Funcionário de Limpezas",
      "Outro",
      ["Vontade de Trabalhar"],
      "Procura- se funcionario de limpezas para feup e aefeup",
      "700");
  jobs.add(job0);
  Job job1 = new Job(
      "1",
      "Professor de LCOM",
      "L.EIC",
      [
        "Graduation in Engenharia Informática",
        "5 anos de experiência em Javascript",
        "Vontade de Ensinar"
      ],
      "Procura-se professor para ocupar vaga como regente de LCOM",
      "2000");
  jobs.add(job1);

  Job job2 = new Job(
      "2",
      "Diretor de Curso",
      "L.EGI",
      [
        "Graduation in Engenharia E Gestão Industrial",
        "5 anos de experiência em Javascript",
        "Vontade de Dirigir"
      ],
      "Procura- se diretor de curso para L.EGI",
      "4000");
  jobs.add(job2);

  Job job3 = new Job(
      "3",
      "Responsável do ano curricular do curso de Eng. Civil",
      "L.EC",
      ["Vontade de Ajudar"],
      "Procura-se aluno interessado em organizar e ouvir todos os pedidos e assuntos relacionados ao ano 3 do curso L.EC 21/22",
      "100");
  jobs.add(job3);
  return jobs;
}

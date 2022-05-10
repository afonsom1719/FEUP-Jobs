class Job {
  String _title = '';
  String _departm = '';
  String _description = '';
  List<String> _requirements = [];
  String _extra = '';
  int id = 0;
  int salary = 0;
}

List<Job> createJobs() {
  List<Job> jobs = [];

  Job j1 = new Job();
  j1._title = 'Professor de LCOM';
  j1.id = 0;
  j1._departm = 'L.EIC';
  j1._requirements = [
    'Graduation in Engenharia Informática',
    '5 anos de experiência em Javascript',
    'Vontade de Aprender'
  ];

  j1._description =
      'Para ofertas de emprego ou estágio exclusivamente em Portugal, o IPCA disponibiliza-te a Talent Portugal, com mais de 200 empresas dos melhores empregadores em Portugal Podes pesquisar as empresas de acordo com as tuas preferências, verificar o que te oferecem e depois realizar a candidatura a ofertas de estágio e emprego ou candidatura espontânea';

  j1._extra =
      'Your resume is a concise document that describes the work experience, professional skills and education that qualifies you for a job. Some industries and employers may look for more data that helps them understand your personality, ambitions or particular skills. An additional information section on your resume can include activities and pursuits outside of work that help a prospective employer know you better.';
/*...........*/
  Job j2 = new Job();

  j2._title = 'Funcionário de Limpezas';
  j2.id = 1;
  j2._departm = 'Outro';
  j2._requirements = ['Vontade de Trabalhar'];

  j2._description = 'Procura- se funcionario de limpezas para feup e aefeup';
  j2._extra =
      'Your resume is a concise document that describes the work experience, professional skills and education that qualifies you for a job. Some industries and employers may look for more data that helps them understand your personality, ambitions or particular skills. An additional information section on your resume can include activities and pursuits outside of work that help a prospective employer know you better.';

  /*...........*/

  Job j3 = new Job();

  j3._title = 'Diretor de Curso';

  j3.id = 2;
  j3._departm = 'L.EGI';
  j3._requirements = [
    'Graduation in Engenharia E GESTAO Industrial',
    '5 anos de experiência em Javascript',
    'Vontade de Dirigir'
  ];

  j3._description = 'Procura- se diretor de curso para L.EGI';
  j3._extra =
      'Your resume is a concise document that describes the work experience, professional skills and education that qualifies you for a job. Some industries and employers may look for more data that helps them understand your personality, ambitions or particular skills. An additional information section on your resume can include activities and pursuits outside of work that help a prospective employer know you better.';

  /*...........*/

  Job j4 = new Job();

  j4._title = 'Diretor de Turma';

  j4.id = 3;
  j4._departm = 'L.EIC';
  j4._requirements = [
    'Graduation in Engenharia Informática',
    '5 anos de experiência em Javascript',
    'Vontade de Aprender'
  ];

  j4._description =
      'Para ofertas de emprego ou estágio exclusivamente em Portugal, o IPCA disponibiliza-te a Talent Portugal, com mais de 200 empresas dos melhores empregadores em Portugal Podes pesquisar as empresas de acordo com as tuas preferências, verificar o que te oferecem e depois realizar a candidatura a ofertas de estágio e emprego ou candidatura espontânea';
  j4._extra =
      'Your resume is a concise document that describes the work experience, professional skills and education that qualifies you for a job. Some industries and employers may look for more data that helps them understand your personality, ambitions or particular skills. An additional information section on your resume can include activities and pursuits outside of work that help a prospective employer know you better.';

  /*...........*/

  jobs.add(j1);
  jobs.add(j2);
  jobs.add(j3);
  jobs.add(j4);
  
  return jobs;

}

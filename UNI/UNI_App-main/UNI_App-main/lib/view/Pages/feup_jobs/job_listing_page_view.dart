import 'package:flutter/material.dart';
import 'package:uni/view/Pages/feup_jobs/job_contact_form_page_view.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import '../../Widgets/feup_jobs/bullet_list.dart';

class JobListingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JobListingState();
}

class JobListingState extends SecondaryPageViewState {
  final String _title = 'Titulo Posição';
  final String _departm = 'Departamento';
  final String _description =
      "Para ofertas de emprego ou estágio exclusivamente em Portugal, o IPCA disponibiliza-te a Talent Portugal, com mais de 200 empresas dos melhores empregadores em Portugal Podes pesquisar as empresas de acordo com as tuas preferências, verificar o que te oferecem e depois realizar a candidatura a ofertas de estágio e emprego ou candidatura espontânea";
  final List<String> _requirements = [
    'Graduation in Engenharia Informática',
    '5 anos de experiência em Javascript',
    'Vontade de Aprender'
  ];

  final String _extra =
      "Your resume is a concise document that describes the work experience, professional skills and education that qualifies you for a job. Some industries and employers may look for more data that helps them understand your personality, ambitions or particular skills. An additional information section on your resume can include activities and pursuits outside of work that help a prospective employer know you better.";
  @override
  Widget getBody(BuildContext context) {
    return Padding(
        key: Key("fullJobListing"),
        padding: const EdgeInsets.all(20),
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              _title,
              style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 50),
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 5.0),
              child: Text(
                _departm,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: const Text(
                "Details:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 15.0),
              child: Text(
                _description,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: const Text(
                "Requirements:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                textAlign: TextAlign.left,
              )),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: UnorderedList(_requirements),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 20.0),
              child: const Text(
                "Extra Information:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 5.0, top: 15.0, bottom: 30),
              child: Text(
                _extra,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                textAlign: TextAlign.left,
              )),
          Container(
              height: 50,
              color: Colors.orange,
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobContactFormView()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 169, 47, 26),
                  ),
                  child: const Text('Apply'))),
        ]));
  }
}

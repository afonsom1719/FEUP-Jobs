import 'package:feup_jobs/jobBank.dart';
import 'package:feup_jobs/register.dart';
import 'package:flutter/material.dart';
import 'Components/NavigationBar.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'listing.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  static const String _title = 'FEUP Jobs';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: MyStatefulWidget(),
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String initialCountry = 'PT';
  PhoneNumber number = PhoneNumber(isoCode: 'PT');
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Contact',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 50),
                    ),
                    const Text(
                      'Form',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 169, 47, 26),
                          fontWeight: FontWeight.w500,
                          fontSize: 50),
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  iconColor: Color.fromARGB(255, 169, 47, 26),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 169, 47, 26),
                  )),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  iconColor: Color.fromARGB(255, 169, 47, 26),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 169, 47, 26),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color.fromARGB(255, 169, 47, 26),
                )),
                inputDecoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  iconColor: Color.fromARGB(255, 169, 47, 26),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 169, 47, 26),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 169, 47, 26),
                  )),
                ),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Message',
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  iconColor: Color.fromARGB(255, 169, 47, 26),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 169, 47, 26),
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 169, 47, 26),
                  )),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
                height: 50,
                color: Colors.orange,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 169, 47, 26),
                    ),
                    child: const Text('Submit'))),
          ],
        ));
  }
}

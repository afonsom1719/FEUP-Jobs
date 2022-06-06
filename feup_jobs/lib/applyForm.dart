import 'package:feup_jobs/jobBank.dart';
import 'package:feup_jobs/register.dart';
import 'package:flutter/material.dart';
import 'Components/NavigationBar.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'listing.dart';

class ApplyForm extends StatelessWidget {
  final String jobPosition;
  ApplyForm({required this.jobPosition});

  static const String _title = 'FEUP Jobs';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: MyStatefulWidget(jobPosition: jobPosition,),
        drawer: const CustomDrawer(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final String jobPosition;
  const MyStatefulWidget({Key? key, required this.jobPosition}): super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  late String jobPos;

  String initialCountry = 'PT';
  PhoneNumber number = PhoneNumber(isoCode: 'PT');
  final TextEditingController controller = TextEditingController();

  DateTime selectedDate = DateTime.now();



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    jobPos = widget.jobPosition;
    return Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    const Text(
                      'Application Form',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 35),
                    ),
                    Text(
                      jobPos,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 169, 47, 26),
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                  ],
                )),
            const SizedBox(height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Personal Details',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const TextField(
                    decoration: InputDecoration(
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
                Row(
                  children: [

                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 170,
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'ID',
                              labelStyle: TextStyle(color: Colors.orangeAccent),
                              iconColor: Color.fromARGB(255, 169, 47, 26),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 169, 47, 26),
                                  )),
                            ),
                          ),
                        ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            primary: Colors.orangeAccent,
                            minimumSize: const Size(175, 60)
                          ),
                          onPressed: () => _selectDate(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(Icons.cake_outlined),
                              const SizedBox(width: 20,),
                              Text("${selectedDate.toLocal()}".split(' ')[0],style: const TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const TextField(
                    decoration: InputDecoration(
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
                const SizedBox(
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
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: number,
                    textFieldController: controller,
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: const OutlineInputBorder(
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(color: Colors.orangeAccent),
                      iconColor: Color.fromARGB(255, 169, 47, 26),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 169, 47, 26),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

              ],
            ),
            Container(
                height: 50,
                color: Colors.orange,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 169, 47, 26),
                    ),
                    child: const Text('Submit'))),
          ],
        ));
  }
}

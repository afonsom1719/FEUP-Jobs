import 'package:flutter/material.dart';
import 'listing.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = 'FEUP Jobs';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 169, 47, 26),
        ),
        body: const MyStatefulWidget(),
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'FEUPjobs',
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 50),
                )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'User Name',
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
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  iconColor: Color.fromARGB(255, 169, 47, 26),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 169, 47, 26),
                  )),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',
                  style: TextStyle(color: Colors.orange)),
            ),
            Container(
                height: 50,
                color: Colors.orange,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Listing()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 169, 47, 26),
                    ),
                    child: const Text('Login'))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
            ),
          ],
        ));
  }
}

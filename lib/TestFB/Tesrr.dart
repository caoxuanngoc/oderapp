
import 'package:flutter/material.dart';

class TestKey extends StatefulWidget {
  const TestKey({Key? key}) : super(key: key);

  @override
  State<TestKey> createState() => _TestKeyState();
}

class _TestKeyState extends State<TestKey> {
  TextEditingController txtEmail= TextEditingController();
  TextEditingController txtPass= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tets"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: txtEmail,
              decoration: InputDecoration(
                label: Text("Emal")
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: txtPass,
              decoration: InputDecoration(
                  label: Text("Emal")
              ),
            ),
          ],
        ),


        ),
      );

  }
}

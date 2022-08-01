import 'package:flutter/material.dart';
import 'package:flutter1/formRegistration.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SecondPage> {
  TextEditingController ctrphone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("halaman dua"),
        ),
        body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                    controller: ctrphone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "input phone number",
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, ctrphone.text);
                    },
                    child: Text("submit")),
              ],
            )));
  }
}

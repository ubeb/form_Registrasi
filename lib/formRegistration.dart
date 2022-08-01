import 'package:flutter/material.dart';
import 'package:flutter1/page2.dart';

class FormRegistration extends StatefulWidget {
  const FormRegistration({Key? key, required String title}) : super(key: key);

  @override
  State<FormRegistration> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FormRegistration> {
  TextEditingController ctrUsername = new TextEditingController();
  TextEditingController ctrPassword = new TextEditingController();

  int id = 1;
  String MyPhone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                controller: ctrUsername,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                )),
            SizedBox(height: 20),
            TextField(
              controller: ctrPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("pilih jenis kelamin", style: TextStyle(fontSize: 15)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      id = 1;
                    });
                  },
                ),
                Text("male")
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      id = 2;
                    });
                  },
                ),
                Text("female"),
              ],
            ),
            Text("phone: " + MyPhone),
            ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                  print("hasil" + result.toString());
                  setState(() {
                    MyPhone = result.toString();
                  });
                },
                child: Text("phone number")),
            Center(
              child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}

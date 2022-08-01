import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class kalkulator extends StatefulWidget {
  const kalkulator({Key? key}) : super(key: key);

  @override
  State<kalkulator> createState() => _kalkulatorState();
}


class _kalkulatorState extends State<kalkulator> {
  TextEditingController ctrPanjang = new TextEditingController();
  TextEditingController ctrLebar = new TextEditingController();
  TextEditingController ctrHasil = new TextEditingController();
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("formRegistration"),),
      body: Container(
        margin:EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              controller: ctrPanjang,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Panjang',
              ),
            ),
             Container(height: 20 ,),
            TextFormField(
                 validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              controller: ctrLebar,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Lebar',
              ),
            ),
             SizedBox(height: 10,),
            Center (
              child:Container(
                width:200,
                child:ElevatedButton(onPressed: (){
                  setState(() {
                  if (ctrPanjang.text.isNotEmpty && ctrLebar.text.isNotEmpty) {
                    ctrHasil.text =
                    ( int.parse(ctrPanjang.text) * int.parse(ctrLebar.text)).toString();
                  }else{
                     Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Masukan Angka ke Kolom yang kosong",
                      //desc: "Selamat anda berhasil login",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Selanjutnya",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ).show();
                    return;
                  }
                  });
                },
                child: Text("Hitung")),
              
              )
            ),
            SizedBox(height: 10,), 
            Align(
            alignment: Alignment.center,
          child: Text( 
            "Hasil : ${ctrHasil.text}", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold, color: Colors.black,), 
             
            ),
             ),
           
          ],
        ),
      ),
    );
  }
}
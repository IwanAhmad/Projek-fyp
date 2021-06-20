import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirsttime/sayuran_model.dart';
import 'dart:convert' as convert;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  // ignore: deprecated_member_use
  List<Sayuranmodel> sayurans = List<Sayuranmodel>();

 getsayuranfromsheet() async {
    var raw = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbxUxXbhj7bxNnYcB1nKoJyf6uesXYeG-IADxrgtom8rFxRsev97-Hko7_dxi4zgt8Fh9w/exec"));
    var jsonsayuran = convert.jsonDecode(raw.body);
    //print('this is json sayuran $jsonsayuran');

  jsonsayuran.forEach((element) {
      //print('$element THIS IS NEXT>>>>>>>');
      Sayuranmodel kude = new Sayuranmodel();

      kude.namavarieti = element['nama_varieti'];
      kude.unit = element['unit'];
      kude.harga = element['harga'].toString();
    
     
      sayurans.add(kude);
      //print(sayurans.length);
    });

    //print('${sayurans[0]}');
 
  }

  @override
  void initState(){
    getsayuranfromsheet();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muka depan"),
        elevation: 0,
      ),
      body: Container(
        
        child: ListView.builder(
            itemCount: sayurans.length,
            itemBuilder: (context, index) {
              return Sayurantile(               
                namavarieti: sayurans[index].namavarieti,
                unit: sayurans[index].unit,
                harga: sayurans[index].harga,
              );
            }),
      ),
    );
  }
}


class Sayurantile extends StatelessWidget{
  
  final String namavarieti, unit, harga;
  Sayurantile({this.namavarieti, this.unit, this.harga});
  
  @override
  Widget build(BuildContext context){
    return 
    Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      )),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(namavarieti),
                  Text(
                    'HARGA: RM$harga UNTUK 1 $unit ',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //array of controllers
  List<TextEditingController> contol = [
    for (int i = 1; i < 5; i++) TextEditingController()
  ];
  //Deklarasi variabel
  var pjg = 0;
  var lbr = 0;
  var luas = 0;
  var keliling = 0;
  bool isclicked = false;

  String pilihanmenu = "Luas";
  String pilihanmenuout = "";

  @override
  void dispose() {
    for (int i = 1; i < 5; i++) {
      contol[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //dropdown list
    List<DropdownMenuItem<String>> Pilih = [];
    //item
    var item1 = const DropdownMenuItem<String>(
      value: "Luas",
      child: Text("Luas ="),
    );
    var item2 = const DropdownMenuItem<String>(
      value: "keliling",
      child: Text("Keliling = "),
    );
    Pilih.add(item1);
    Pilih.add(item2);

    //materialapp
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(203, 208, 255, 0.498),
        appBar: AppBar(
          title: const Text('Persegi Panjang'),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Panjang :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Panjang',
                    hintText: '0',
                  ),
                  controller: contol[0],
                ),
              ),
            ),
            Text(
              'Lebar :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lebar',
                    hintText: '0',
                  ),
                  controller: contol[1],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    pjg = int.parse(contol[0].text);
                    lbr = int.parse(contol[1].text);
                    luas = pjg * lbr;
                    keliling = 2 * pjg + 2 * lbr;
                    if (pjg != 0 && lbr != 0) isclicked = true;
                  });
                },
                child: const Text('Hasil'),
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            isclicked
                ? Text(
                    'Luas = $luas',
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(36, 32, 71, 1)),
                  )
                : Container(),
            DropdownButton(
                value: pilihanmenu,
                items: Pilih,
                onChanged: (String? newvalue) {
                  if (newvalue != null) {
                    pilihanmenu = newvalue;
                  }
                })
          ],
        )),
      ),
    );
  }
}

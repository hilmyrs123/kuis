import 'package:flutter/material.dart';

class Data {
  String kode = "";

  String nama = "";

  String vol = "";

  String turnOver = "";

  String harga = "";

  String naikTurun = "";

  String pctNaikTurun = "";
}

//item dropdown
const List<String> listdropdown1 = <String>[
  "Active Turn Over",
  "Active Volume"
];
const List<String> listdropdown2 = <String>["1D", "1W"];

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
  //pilihanactive
  String pilihanactive1 = listdropdown1.first;
  String pilihanactive2 = listdropdown2.first;
  List<String> data = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      data.add("Data ke $i ");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: const FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: const Text('Quiz Flutter'),
            actions: const <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Column(
          children: [
            //Row untuk dropdown
            Row(
              children: [
                Expanded(
                  //Dropdown 1
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: pilihanactive1,
                    onChanged: (String? value) {
                      setState(() {
                        pilihanactive1 = value!;
                      });
                    },
                    items: listdropdown1
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                //Dropdown 2
                DropdownButton<String>(
                  value: pilihanactive2,
                  onChanged: (String? value) {
                    setState(() {
                      pilihanactive2 = value!;
                    });
                  },
                  items: listdropdown2
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            //Kontainer kosong buat white space
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: const Center(
                              child: Text(
                            'BBRI',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          height: 50,
                          child: Center(child: Text('$pilihanactive1')),
                        )
                      ],
                    )),
                Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: const Center(
                              child: Text('Bank Rakyat Indonesia')),
                        ),
                        Container(
                          height: 50,
                          child: const Center(child: Text('125M')),
                        ),
                        Container(
                          height: 50,
                          child: const Center(child: Text('605B')),
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  child: Text('4820'),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: const Center(child: Text('+80')),
                      ),
                      Container(
                        height: 50,
                        child: const Center(child: Text('+2.00%')),
                      )
                    ],
                  ),
                ),
                //pembagi
                Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: const Center(child: Text('TLKM')),
                        ),
                        Container(
                          height: 50,
                          child: const Center(child: Text('Volume')),
                        ),
                        Container(
                          height: 50,
                          child: const Center(child: Text('Turn Over')),
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.center,
                  child: ListView(padding: EdgeInsets.all(20), children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text('Telkom Indonesia',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))),
                    Container(alignment: Alignment.center, child: Text('77M')),
                    Container(alignment: Alignment.center, child: Text('310')),
                  ]),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '4810',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: const Center(child: Text('+100')),
                      ),
                      Container(
                        height: 50,
                        child: const Center(child: Text('+5.00%')),
                      )
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 14'),
            content: const Text(
                'Muhammad Hilmy Rasyad Sofyan (hilmyrs123@upi.edu) ; Sabila Rosad (sabila.rosad@upi.edu))'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

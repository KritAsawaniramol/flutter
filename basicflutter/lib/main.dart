// ignore_for_file: prefer_const_constructors

import 'package:basicflutter/MoneyBox.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ExchangeRate.dart';

void main() {
  //runApp(MyApp());
  var app = MyApp();
  runApp(app);
}

//สร้าง Widget ขึ้นมาใช้เอง
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return Widget ที่เราสร้างขึ้นมาใน Container
    return MaterialApp(
      title: "MyApp",
      home: MyHomePage(),
      //child: Image(
      //  image: NetworkImage(
      //      "https://www.google.co.th/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"),
      //),

      //child: Text(
      //  "Hi",
      //  style: TextStyle(fontSize: 30, color: Colors.purple),
      //),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//ส่วนของหน้า App ที่อยากให้มีการเปลี่ยนแปลง
class _MyHomePageState extends State<MyHomePage> {
  late ExchangeRate _dataFromAPI;
  //การแสดงผลข้อมูล
  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }

  Future<ExchangeRate> getExchangeRate() async {
    var url = Uri.parse("https://api.exchangerate-api.com/v4/latest/THB");
    var response = await http.get(url);
    _dataFromAPI = exchangeRateFromJson(response.body); //json -> dart object
    return _dataFromAPI;
  }

  @override
  Widget build(BuildContext context) {
    print("Call build");
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "อัตราการแลกเปลี่ยนสกุลเงิน",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: getExchangeRate(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //ดึงข้อมูลจาก getExchangeRate มาครบ
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data;
              return Column(
                children: [
                  MoneyBox("THB", 1, Colors.blue, 150),
                  SizedBox(height: 5),
                  MoneyBox("EUR", result.rates["EUR"], Colors.green, 120),
                  SizedBox(height: 5),
                  MoneyBox("USD", result.rates["USD"], Colors.blue, 120),
                ],
              );
            }
            return LinearProgressIndicator();
          },
        ));
  }
}

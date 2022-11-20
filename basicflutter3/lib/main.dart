// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'FoodMenu.dart';
import 'MoneyBox.dart';

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
  //การแสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "บัญชีของฉัน",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MoneyBox("ยอดคงเหลือ", 1000, Colors.lightBlue, 120),
              SizedBox(
                height: 5,
              ),
              MoneyBox("รายรับ", 10000.5123, Colors.green, 100),
              SizedBox(
                height: 5,
              ),
              MoneyBox("รายจ่าย", 3000, Colors.red, 100),
              SizedBox(
                height: 5,
              ),
              MoneyBox("ค้างชำระเงิน", 1200, Colors.orange, 100)
            ],
          ),
        ));

    // Center(
    //  child: ListView(
    //    children: getData(30),
    //  ),
    //),
  }

  //List<Widget> getData(int count) {
  //  //กลุ่มข้อมูล Text Wiget
  //  List<Widget> data = [];
  //  for (var i = 0; i < count; i++) {
  //    var menu = ListTile(
  //      title: Text(
  //        "เมนูที่ ${i + 1}",
  //        style: TextStyle(fontSize: 25),
  //      ),
  //      subtitle: Text("หัวข้อย่อย ${i + 1}"),
  //    );
  //    data.add(menu);
  //    //data.add(Text(
  //    //  "รายการที่ ${i + 1}",
  //    //  style: TextStyle(fontSize: 25),
  //    //));
  //  }
  //  return data;
  //}
}

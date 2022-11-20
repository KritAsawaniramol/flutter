import 'package:flutter/material.dart';

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
  int number = 0; //การสร้าง state

  @override
  Widget build(BuildContext context) {
    //กลุ่มข้อมูล Text Wiget
    List<Widget> data = [];
    data.add(Text("กดปุ่มเพื่อเพิ่มจำนวนตัวเลข"));
    data.add(
      Text(
        '$number', //number.toString(),
        style: TextStyle(fontSize: 60),
      ),
    );
    data.add(Text("Hello"));
    data.add(Text("Hello2"));
    for (var i = 0; i < 10; i++) {
      data.add(Text("รายการที่ ${i + 1}"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("โปรแกรมนับเลข"),
      ),
      body: Center(
        child: ListView(
            // mainAxisAlignment กำหนดตำแหน่งเริ่มต้นของ Column
            children: data
            //[
            //  Text('กดปุ่มเพื่อเพิ่มจำนวนตัวเลข'),
            //  Text(
            //    '$number', //number.toString(),
            //    style: TextStyle(fontSize: 60),
            //  ),
            //],
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: Icon(Icons.add),
      ),
    );
  }

  void addNumber() {
    setState(() {
      number++;
    });
  }
}

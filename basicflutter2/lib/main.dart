import 'package:flutter/material.dart';
import 'FoodMenu.dart';

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
  //กลุ่มข้อมูล
  List<FoodMenu> menu = [
    FoodMenu("กุ้งเผา", "500", "assets/images/image1.jpg"),
    FoodMenu("กะเพราหมู", "80", "assets/images/image2.jpg"),
    FoodMenu("ส้มตำ", "60", "assets/images/image3.jpg"),
    FoodMenu("ผัดไทย", "40", "assets/images/image4.jpg")
  ];

  //การแสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("เลือกเมนูอาหาร"),
        ),
        body: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              FoodMenu food = menu[index];
              return ListTile(
                leading: Image.asset(food.img),
                title: Text(
                  food.name,
                  style: TextStyle(fontSize: 30),
                ),
                subtitle: Text("ราคา " + food.price + " บาท"),
                onTap: () => print("คุณเลือกเมนู ${food.name}"),
              );
            }));

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

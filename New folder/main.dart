void main() async {
  //login
  print(await loginUser());
}

Future<String> loginUser() async {
  //ดึงข้อมูล
  var user = await getUserFromDatabase();
  return user;
}

//ข้อมูลที่จะได้ในอนาคต ต้องรอ 10 วิ
Future<String> getUserFromDatabase() {
  return Future.delayed(Duration(seconds: 10), () => "Kongruksiam");
}

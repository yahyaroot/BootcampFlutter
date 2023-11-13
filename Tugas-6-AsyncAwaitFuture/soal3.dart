import 'dart:async';

void main() async {
  print("Ready. Sing");

  await Future.delayed(Duration(seconds: 5));
  await line();

  await Future.delayed(Duration(seconds: 3));
  await line2();

  await Future.delayed(Duration(seconds: 2));
  await line3();

  await Future.delayed(Duration(seconds: 1));
  await line4();
}

Future<void> line() async {
  print("Pernahkan kau merasa");
}

Future<void> line2() async {
  print("Pernahkah kau merasa……");
}

Future<void> line3() async {
  print("Pernahkah kau merasa");
}

Future<void> line4() async {
  print("Hatimu hampa, pernahkah kau merasa hatimu kosong....");
}

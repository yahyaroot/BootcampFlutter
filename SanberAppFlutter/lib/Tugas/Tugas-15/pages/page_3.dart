import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberapp/Tugas/Tugas-15/routes/route_name.dart';

class Pagethree extends StatelessWidget {
  const Pagethree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Halaman 3"),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                    RouteName.page_2); // Assuming RouteName.page_2 is defined
              },
              child: Text("kembali ke page 2 "),
            ), // ElevatedButton
          ], // children
        ), // Column
      ), // Center
    ); // Scaffold
  }
}

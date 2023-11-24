import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberapp/Tugas/Tugas-15/routes/route_name.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Halaman 2"),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.page_3);
                },
                child: Text("menuju halaman tiga ")), // ElevatedButton
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.page_1);
                },
                child: Text("kembali ke page 1 ")) // ElevatedButton
          ],
        ), // Column
      ),
    ); // Center ); // Scaffold
  }
}

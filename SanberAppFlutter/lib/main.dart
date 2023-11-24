import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberapp/Tugas/Tugas-15/pages/page_1.dart';
import 'package:sanberapp/Tugas/Tugas-15/routes/page_routes.dart';
// import 'package:sanberapp/Tugas/Tugas-8/Tugas-8.dart';
// import 'package:sanberapp/Tugas/Tugas-9/Telegram.dart';
// import 'package:sanberapp/Tugas/Tugas-10/login.dart';
// import 'package:sanberapp/Tugas/Tugas-11/login.dart';
// import 'package:sanberapp/Tugas/Tugas-11/login.dart';
// import 'package:sanberapp/Tugas/Tugas-12/getDataScreen.dart';
// import 'package:sanberapp/Tugas/Tugas-13/login.dart';
// import 'package:sanberapp/Tugas/Tugas-14/get_data_screen.dart';
import 'package:sanberapp/firebase_options.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // Tugas 8
      // home: const MyHomePage(title: 'Sanber App'),

      // Tugas 9
      // home: Telegram(),

      // Tugas 10
      // home: LoginPage(),

      //  Tugas 11
      // home: LoginPageTask(),

      //  Tugas 12
      // home: GetDataScreen(),

      //  Tugas 13
      // home: LoginPageStart(),

      //  Tugas 14
      // home: GetDataScreenStateManagement(),

      //  Tugas 15

      home: PageOne(),
      getPages: pageRouteApp.pages,
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:sanberapp/Tugas/Tugas-8/Tugas-8.dart';
// import 'package:sanberapp/Tugas/Tugas-9/Telegram.dart';
// import 'package:sanberapp/Tugas/Tugas-10/login.dart';
// import 'package:sanberapp/Tugas/Tugas-11/login.dart';
import 'package:sanberapp/Tugas/Tugas-12/getDataScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
      home: GetDataScreen(),
    );
  }
}

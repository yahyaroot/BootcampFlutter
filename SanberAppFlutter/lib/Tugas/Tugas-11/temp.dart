import 'package:flutter/material.dart';
import 'package:sanberapp/Tugas/Tugas-11/Card/profile.dart';
import 'package:sanberapp/Tugas/Tugas-11/Card/trending.dart';
import 'package:sanberapp/Tugas/Tugas-11/Card/category.dart';
// import 'package:sanberapp/Tugas/Tugas-11/drawerScreen.dart';
import 'package:sanberapp/Tugas/Tugas-11/Controller/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  @override
  _DrawwerScreenState createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Amri Yahya"),
          currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/myfoto.png")),
          accountEmail: Text("amriyahya@gmail.com"),
        ),
        DrawerListTile(
          iconData: Icons.group,
          title: "NewGroup",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.lock,
          title: "New Secret Group",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.notifications,
          title: "New Channel Chat",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.contacts,
          title: "contacts",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.bookmark_border,
          title: "Saved Message",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.phone,
          title: "Calls",
          onTilePressed: () {},
        )
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;
  const DrawerListTile(
      {Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 30),
      child: ListView(
        children: [
          SizedBox(height: 20),
          // DrawerScreen(),
          ProfileWidget(),
          SizedBox(height: 20),
          TrendingWidget(),
          SizedBox(height: 20),
          CategoryWidget(),
        ],
      ),
    );
  }
}

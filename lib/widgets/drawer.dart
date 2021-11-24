import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  // decoration: BoxDecoration(color: Colors.red),
                  margin: EdgeInsets.zero,
                  accountName: Text("Ijaz Ahmad"),
                  accountEmail: Text("ejazmaitla@gmail.com"),
                )),
            ListTile(
                title: Text(
                  "Home",
                  textScaleFactor: 1.5,
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                )),
            ListTile(
                title: Text(
                  "Profile",
                  textScaleFactor: 1.5,
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                )),
            ListTile(
                title: Text(
                  "Email",
                  textScaleFactor: 1.5,
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}

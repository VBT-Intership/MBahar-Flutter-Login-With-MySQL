import 'dart:convert';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:LoginAndRegistration/login.dart';

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;

  MainMenu(this.signOut);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  int currentIndex = 0;
  String selectedIndex = 'TAB: 0';

  String email = "", name = "", id = "";
  TabController tabController;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      email = preferences.getString("email");
      name = preferences.getString("name");
    });
    print("id" + id);
    print("user" + email);
    print("name" + name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              signOut();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
            child: Column(
          children: <Widget>[
            Container(
              child: ClipRRect(
                child:
                    Image.network("https://www.vbt.com.tr/Assets/img/logo.png"),
              ),
            ),
            Padding(
              child: Text("Welcome to VBT",
                  style: TextStyle(fontSize: 30, color: Colors.white70)),
              padding: EdgeInsets.only(top: 60),
            ),
          ],
        )),
      ),
    );
  }

  callToast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mvp/contacts/views/contact_list.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String name = 'flutter-mvp';
  Future<bool> _configure() async {
    //Firestore firestore = Firestore.instance;
    //firestore.collection("testUser").document().setData({"Name": "Jibran"});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFFFFFF),
      ),
      home: FutureBuilder<bool>(
        future: _configure(),
        builder: (context, isLogin) {
          if (isLogin.hasData) {
            return ContactList();
          }
          // By default, show a loading spinner.
          return Container(
            color: Colors.white,
          );
        },
      ),
    );
  }
}

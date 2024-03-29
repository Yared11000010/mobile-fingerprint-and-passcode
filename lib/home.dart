import 'package:flutter/material.dart';
import 'package:biometric/auth.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (c) => Auth()));
              })
        ],
      ),
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}

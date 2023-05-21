import 'package:biometric/passcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'home.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

   LocalAuthentication _auth=LocalAuthentication();
   bool _isBioFinger=false;
   bool _checkBio =false;
    @override 
    void initState(){
      super.initState();
      _checkBiometrics();
      _listsBioAndFindFingerType();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Biometric'),
        backgroundColor: Color.fromARGB(255, 3, 46, 63),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: _startAuth,
              icon: Icon(
                Icons.fingerprint,
                size: 50,
              ),
              iconSize: 60,
            ),
            SizedBox(
              height: 15,
            ),
              Text('Scan your Fingerprint'),

            SizedBox(
              height: 15,
            ),
           GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PasscodeScreen()),
              );
            },
            child: Text(
              'SWipe up for your Passcode',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 6, 92, 132),
              ),
            ),
          ),
          ],
        ),
        
      ),
    );
  }

  void _checkBiometrics() async {
    try {
      final bio = await _auth.canCheckBiometrics;
      setState(() {
        _checkBio = bio;
      });
      print('Biometric=$_checkBio');
    } catch (e) {

    }
  }
  void _listsBioAndFindFingerType() async {
      List<BiometricType> _listType=[];
      try{
        _listType = await _auth.getAvailableBiometrics();

      }on PlatformException catch (e){
        print(e.message);
      }
      print('List Biometric =$_listType');

      if(_listType.contains(BiometricType.fingerprint)){
        setState(() {
          _isBioFinger=true;
        });
        print('fingerprint is $_isBioFinger');
      }
  }
  void _startAuth() async {
      bool _isAuthenticated=false;
      try{
        _isAuthenticated= await _auth.authenticate(
          localizedReason: 'Scan your fingerprint',
          options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
      }on PlatformException catch (e){
        print(e.message);
      }
      if(_isAuthenticated){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (c)=>Home()));
      }
  }

}

import 'package:flutter/material.dart';

class PasscodeScreen extends StatefulWidget {
  @override
  _PasscodeScreenState createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  String _passcode = '';

  void _addDigit(String digit) {
    setState(() {
      _passcode += digit;
    });
    if (_passcode.length == 4) {
      if (_passcode == '1111') {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _passcode = '';
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Incorrect Passcode'),
              content: Text('Please try again.'),
              actions: [
                TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ],
            );
          },
        );
      }
    }
  }

  void _removeDigit() {
    setState(() {
      _passcode = _passcode.substring(0, _passcode.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Passcode'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _passcode,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDigitButton('1'),
                _buildDigitButton('2'),
                _buildDigitButton('3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDigitButton('4'),
                _buildDigitButton('5'),
                _buildDigitButton('6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDigitButton('7'),
                _buildDigitButton('8'),
                _buildDigitButton('9'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 64),
                _buildDigitButton('0'),
                IconButton(
                  icon: Icon(Icons.backspace),
                  onPressed: _removeDigit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildDigitButton(String digit) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
        
        
      ),
      child: ElevatedButton(
        child: Text(
          digit,
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(0, 250, 242, 242),
          onPrimary: Colors.black,
          elevation: 0,
        ),
        onPressed: () => _addDigit(digit),
      ),
    ),
  );
}

}

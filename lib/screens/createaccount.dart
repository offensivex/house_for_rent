import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_for_rent/screens/welcome.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Create an account so that you can be in touch with our information.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Full Name:',
                      style: TextStyle(
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your full name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password:',
                      style: TextStyle(
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 70.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 150.0, vertical: 15.0),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    'By signing in, I accept to terms and conditions.',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Read private policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors
                            .blue), // Added this line to make the text blue
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

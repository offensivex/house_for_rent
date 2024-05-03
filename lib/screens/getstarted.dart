import 'package:flutter/material.dart';
import 'package:house_for_rent/screens/houses.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: screenHeight * 0.1,
                backgroundImage: AssetImage(
                    'assets/h.jpg'), // replace 'your_image.jpg' with your image file path
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'Find Home',
                style: TextStyle(
                  fontSize: screenHeight * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome to House',
                style: TextStyle(
                  fontSize: screenHeight * 0.03,
                ),
              ),
              Text(
                'Rentals',
                style: TextStyle(
                  fontSize: screenHeight * 0.03,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Make your dreams come true',
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HousesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.15,
                      vertical: screenHeight * 0.015),
                ),
                child: Text(
                  'Let\'s Get Started',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for Skip button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.015),
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

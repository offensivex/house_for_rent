import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'houses.dart';

class TenantPage extends StatefulWidget {
  @override
  _TenantPageState createState() => _TenantPageState();
}

class _TenantPageState extends State<TenantPage> {
  String _selectedLocation = 'Choose your location!';
  int _startPrice = 10000;
  int _endPrice = 20000;
  int _numberOfBedrooms = 0;

  @override
  Widget build(BuildContext context) {
    // Getting screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.05, horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: screenHeight * 0.03,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.1,
                  ),
                  Text(
                    'TENANT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.035,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.1),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Where to rent?',
                  style: TextStyle(
                    fontSize: screenHeight * 0.025,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                ),
                value: _selectedLocation,
                items: [
                  "Choose your location!",
                  'Lilongwe',
                  'Blantyre',
                  'Mzuzu',
                  "Zomba",
                  "Mangochi",
                  "Maching",
                  "Liwonde"
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue!;
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.05),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Price Range!',
                  style: TextStyle(
                    fontSize: screenHeight * 0.025,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: screenWidth * 0.05),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      children: [
                        NumberPicker(
                          value: _startPrice,
                          minValue: 10000,
                          itemHeight: screenHeight * 0.03,
                          step: 10000,
                          maxValue: 1000000,
                          onChanged: (value) {
                            setState(() {
                              _startPrice = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      iconSize: screenHeight * 0.05,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Flexible(
                    child: Column(
                      children: [
                        NumberPicker(
                          value: _endPrice,
                          minValue: 20000,
                          itemHeight: screenHeight * 0.03,
                          step: 10000,
                          maxValue: 5000000,
                          onChanged: (value) {
                            setState(() {
                              _endPrice = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Number of bedrooms?',
                      style: TextStyle(
                        fontSize: screenHeight * 0.025,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  NumberPicker(
                    value: _numberOfBedrooms,
                    minValue: 0,
                    step: 1,
                    maxValue: 200,
                    itemHeight: screenHeight * 0.03,
                    onChanged: (value) {
                      setState(() {
                        _numberOfBedrooms = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HousesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.3),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: screenHeight * 0.025),
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0),
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
                      iconSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'TENANT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 70.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Where to rent?',
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
              SizedBox(height: 30.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Price Range!',
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 35.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(children: [
                      // Text(
                      //   'Start',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      NumberPicker(
                        value: _startPrice,
                        minValue: 10000,
                        itemHeight: 30,
                        step: 10000,
                        maxValue: 1000000,
                        onChanged: (value) {
                          setState(() {
                            _startPrice = value;
                          });
                        },
                      ),
                    ]),
                  ),
                  SizedBox(width: 35.0),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      iconSize: 35.0,
                    ),
                  ),
                  SizedBox(width: 30.0),
                  Expanded(
                    child: Column(children: [
                      // Text(
                      //   'End',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      NumberPicker(
                        value: _endPrice,
                        minValue: 20000,
                        itemHeight: 30,
                        step: 10000,
                        maxValue: 5000000,
                        onChanged: (value) {
                          setState(() {
                            _endPrice = value;
                          });
                        },
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Number of bedromms?',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  NumberPicker(
                    value: _numberOfBedrooms,
                    minValue: 0,
                    step: 1,
                    maxValue: 200,
                    itemHeight: 30,
                    onChanged: (value) {
                      setState(() {
                        _numberOfBedrooms = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 50.0),
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
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 120.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18.0),
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

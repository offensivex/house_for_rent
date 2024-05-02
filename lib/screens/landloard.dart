import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class LandlordPage extends StatefulWidget {
  @override
  _TenantPageState createState() => _TenantPageState();
}

class _TenantPageState extends State<LandlordPage> {
  String _selectedLocation = 'Choose your location!';
  int _startPrice = 10000;
  int _endPrice = 20000;
  int _numberOfBedrooms = 0;
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
              SizedBox(height: 40.0),
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
                    'LANDLORD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Text(
                'Lets advertise your',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                'vanct houses',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Location:',
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
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
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Image:',
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: getImage,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.add,
                            color: Colors.blue,
                            // size: 50,
                          ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Price (MWK):',
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Monthly price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 19.0,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for submit button here
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
                    'Upload',
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class House {
  final String imageLocation;
  final double price;
  final int numbetOfRomms;
  final String description;
  final String location;

  House({
    required this.imageLocation,
    required this.price,
    required this.numbetOfRomms,
    required this.description,
    required this.location,
  });
}

class HousesPage extends StatefulWidget {
  @override
  _HousesPageState createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  @override
  Widget build(BuildContext context) {
    List<House> products = [
      House(
        imageLocation: 'assets/h1.jpg',
        price: 20000,
        numbetOfRomms: 2,
        location: "Lilongwe",
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      House(
        imageLocation: 'assets/h2.jpg',
        price: 400000,
        numbetOfRomms: 4,
        location: "Lilongwe",
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      House(
        imageLocation: 'assets/h3.jpg',
        price: 300000,
        numbetOfRomms: 3,
        location: "Lilongwe",
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      House(
        imageLocation: 'assets/h4.jpg',
        price: 25000,
        numbetOfRomms: 1,
        location: "Lilongwe",
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Search bar
              SizedBox(
                height: 100,
              ),
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
                    'HOUSES',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    prefixIcon: Icon(Icons.search,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 105, 108, 252),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Shop image preview
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose your favourite',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'House',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),

              // List of products in grid
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          0.8, // Adjust the aspect ratio as needed
                      crossAxisSpacing: 9,
                      mainAxisSpacing: 9,
                    ),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          // context,
                          // MaterialPageRoute(
                          //   builder: (context) => ProductDescriptionPage(
                          //     product: products.first,
                          //   ), // Navigate to products page with selected shop
                          // ),
                          // );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 105, 108, 252),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  products[index].imageLocation,
                                  width: double.infinity,
                                  height: 120, // Reduce the height here
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MWK ${products[index].price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 164, 174, 182),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Number of Rooms: ${products[index].numbetOfRomms}',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      products[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

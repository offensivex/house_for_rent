import 'package:flutter/material.dart';
import 'package:house_for_rent/screens/landloard.dart';

import 'tenant.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 120.0),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                const Text(
                  'It\'s Nice To Have You Here!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Please Choose One Of',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text(
                  'The Options Below',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TenantPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 91, 74, 248),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Text(
                          'Tenant',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LandlordPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 91, 74, 248),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Text(
                          'Landload',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Welcome to our app,',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'designed for both tenants ',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'and landlords in mind! ',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Whenever you are looking for',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'the perfect place to call home ',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'or seeking responsible and.',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'reliable tenants, we\'ve got',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'you covered.',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const SizedBox(height: 100.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 22),
                    child: Text(
                      'Learn More',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

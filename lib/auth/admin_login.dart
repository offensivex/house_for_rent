import '../auth/forgot_password.dart';
import '../screens/houses.dart';
import '../screens/verification_page.dart';
import '../utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controller/login_controller.dart';
import '../auth/sing_up_page.dart';

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({Key? key}) : super(key: key);

  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final FirebaseAuthController authController = FirebaseAuthController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loginInProgress = false; // Added flag for login progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorz.pageBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                const SizedBox(
                  height: 80,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                      'assets/h.jpg'), // replace 'your_image.jpg' with your image file path
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colorz.appBarColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colorz.appBarColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    elevation: 0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => ForgotPasswordPage(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: const Duration(milliseconds: 0),
                        ),
                      );
                    },
                    child: const Text('Forget Password?',
                        style: TextStyle(color: Colors.blue)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 20, 98, 162),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // elevation: 3.0,
                    ),
                    onPressed: _loginInProgress
                        ? null
                        : () async {
                            await _handleLogin();
                          },
                    child: _loginInProgress
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Log in',
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: 'Register',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => const SignUpPage(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                            ),
                          );
                        },
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    setState(() {
      _loginInProgress = true;
    });

    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      try {
        User? user = await authController.loginUser(email, password, context);

        if (user != null && user.email == "admin@shoptracking.com") {
          // Check if the email is verified

          // Email is verified, navigate to the home page and reset the navigation history
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HousesPage(),
            ),
            (route) =>
                false, // This will remove all the routes until the new route is pushed
          );
        } else {
          // Handle login failure
        }
      } catch (e) {
        // Handle login error
      } finally {
        setState(() {
          _loginInProgress = false;
        });
      }
    } else {
      setState(() {
        _loginInProgress = false;
      });
    }
  }
}

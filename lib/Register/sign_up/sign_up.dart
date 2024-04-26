import 'package:final_project/Register/CustomTextField.dart';
import 'package:final_project/Register/sign_in/sign_in.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  static const routeName = "SignUp";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();



  @override
  //to prevent memory leaks and to clean up resources and avoid potential issues
  void dispose() {
    _emailController.dispose();
   _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    //ensures that the cleanup operations defined in the superclass (State class) are  executed
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform signup operation
      String email = _emailController.text.trim();
      String password = _passwordController.text;
      Navigator.pushReplacementNamed(context, SignIn.routeName);
      // Perform signup operation with collected data
      print('Email: $email');
      //print('Username: $Username');
      print('Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 150.0, left: 16.0, right: 16.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,//stretch to match column width
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200],
                        ),
                        child: CustomTextField(
                          controller: _emailController,
                            label: 'Email',
                            prefixIcon: Icons.email,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            final RegExp emailRegex = RegExp(
                              r'^[a-zA-Z0-9.]+@gmail\.com$',
                            );
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid Gmail address';
                            }

                            // You can add more sophisticated email validation here if needed
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 20.0),

                      Container(
                        child: CustomTextField(
                          controller: _usernameController,
                            label: 'Username',
                            prefixIcon: Icons.person, // Icon for username field

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }

                            // You can add more sophisticated username validation here if needed
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      Container(
                        child: CustomTextField(
                          controller: _passwordController,
                            label: 'Password',
                            prefixIcon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }

                            // You can add more sophisticated password validation here if needed
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),

                      Container(
                        child: CustomTextField(
                          controller: _confirmPasswordController,
                          // prefixIcon: Icons.lock,
                            label: 'Confirm Password',
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 60.0),

                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color
                          padding: EdgeInsets.symmetric(vertical: 15.0), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Button border radius
                          ),
                        ),

                        child: Text('Sign Up', style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white),),

                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to login screen
                                Navigator.pushReplacementNamed(context, SignIn.routeName);
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),



                      //forget password wedgit
                      // Container(
                      //   padding: EdgeInsets.all(10.0),
                      //   child: TextButton(
                      //     onPressed: () {
                      //       // Implement Forgot Password functionality here
                      //     },
                      //     child: Text(
                      //       'Forgot Password?',
                      //       style: TextStyle(
                      //         color: Colors.blue,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}

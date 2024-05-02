import 'package:final_project/Register/CustomTextField.dart';
import 'package:final_project/Register/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project/firebase_utils/FirebaseUtils.dart';
import '../../provider/app_config_provider.dart';
import '../../theming.dart';

String? globalUsername;
String? globalEmail;
String? globalPassword;
//String? globalPhone='';

class SignUp extends StatefulWidget {
  static const routeName = "SignUp";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      //String username = _usernameController.text.trim();
      String password = _passwordController.text;
      // signup operation with collected data
      //  globalEmail = _emailController.text;
      //  globalUsername = _usernameController.text;
      //  globalPassword = _passwordController.text;
      //  print('Email: $email');
      //  print('Username: $username');
      //  print('Password: $password');
      FirebaseUtils.signUpWithEmailAndPassword(email,password,context);

    }
  }







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

  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150.0, left: 16.0, right: 16.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: provider.appTheme== ThemeMode.light ? Theming.primary : Theming.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
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

                      const SizedBox(height: 20.0),

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

                      const SizedBox(height: 20.0,),

                      Container(
                        child: CustomTextField(
                          controller: _passwordController,
                          hidden: hidden,
                          iconButton: IconButton(
                              icon: Icon(hidden == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                if (hidden == true) {
                                  hidden = false;
                                } else {
                                  hidden = true;
                                }
                                setState(() {});
                              }),
                            label: 'Password',
                            prefixIcon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }else if(value.trim().length<6){
                              return 'Your password should be 6 char or more !';
                            }


                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      Container(
                        child: CustomTextField(
                          controller: _confirmPasswordController,
                          hidden: hidden,
                          iconButton: IconButton(
                              icon: Icon(hidden == true ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                if (hidden == true) {
                                  hidden = false;
                                } else {
                                  hidden = true;
                                }
                                setState(() {});
                              }),

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
                      const SizedBox(height: 60.0),

                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theming.primary, // Background color
                          padding: const EdgeInsets.symmetric(vertical: 15.0), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Button border radius
                          ),
                        ),

                        child: const Text('Sign Up', style: TextStyle (fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white),),

                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to login screen
                                Navigator.pushReplacementNamed(context, SignIn.routeName);
                              },
                              child: const Text(
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

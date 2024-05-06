import 'package:final_project/Register/CustomTextField.dart';
import 'package:final_project/Register/forgotpassword/ForgotPassWord.dart';
import 'package:final_project/Register/sign_up/sign_up.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/provider/Auth_Provider.dart';
import 'package:final_project/transition/transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_utils/FirebaseUtils.dart';
import '../../provider/app_config_provider.dart';
import '../../theming.dart';

String? globalEmail;
String? globalPassword;

class SignIn extends StatefulWidget {

  static const String routeName = "SignIn";
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false; // the right place :)
  void submitForm() {
    if (formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text;
      ProviderAuth.prefs.setString('password',password);
      FirebaseUtils.signInWithEmailAndPassword(email, password, context);

      print('Email: $email');
      print('Password: $password');
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
     var authProvider = Provider.of<ProviderAuth>(context);
    return Scaffold(
        body: ListView(
          children: [
            Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 150.0, left: 16.0, right: 16.0),
                child: Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: provider.appTheme == ThemeMode.light
                          ? Theming.primary
                          : Theming.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            child: CustomTextField(
                              controller: emailController,
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
                              },
                            )),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          child: CustomTextField(
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
                            controller: passwordController,
                            label: 'Password',
                            prefixIcon: Icons.lock,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                        // Container(
                        //   child: CheckboxListTile(
                        //     title: Text('Remember me', style: TextStyle(color: Colors.grey),),
                        //     checkColor: Colors.black,
                        //     activeColor: Colors.white,
                        //     value: isChecked,
                        //     onChanged: ( value) {
                        //       setState(() {
                        //         isChecked =   !isChecked; //error fixed :)
                        //         print('checked');
                        //       });
                        //     },
                        //     controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        //   ),
                        // ),
                        SizedBox(
                          height: 35.0,
                        ),
                        ElevatedButton(
                          onPressed: submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theming.primary,
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),

                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context,ForgotPassword.routeName);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, SignUp.routeName);
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ]),
          ],
        ));
  }
}

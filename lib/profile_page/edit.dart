import 'package:final_project/theming.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../Register/sign_up/sign_up.dart';
import '../provider/app_config_provider.dart';




class EditProfile extends StatefulWidget{
  const EditProfile({super.key});
  static const routeName = "EditProfile";

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  var arguments;
  void _submitForm() {

    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text;


      Navigator.pop(context , {
        'name': globalUsername ,
        'email': globalEmail ,
        'password' : globalPassword ,
        'phone': globalPhone ,
      });


      Toast.show("Changes Saved", duration: Toast.lengthLong, gravity:Toast.bottom,backgroundColor: Theming.primary,);




      print('Email: $email');
      print('Password: $password');
    }
  }

  // var email;
  // var pass;
  // var phone;



  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    ToastContext().init(context);

    if(arguments==null){
      arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
      _usernameController.text = arguments['name']??'';
      _passwordController.text = arguments['password']??'';
      _phoneController.text= arguments["phone"]??'';
      _emailController.text= arguments['email']??'';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile" ,style: Theme.of(context).textTheme.titleLarge),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: provider.appTheme==ThemeMode.light? Colors.black:Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 160.0, left: 16.0, right: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //stretch to match column width
                children: [
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.darkBlue) ,
                      controller: _usernameController,

                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle:Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.secondaryText),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person , color: Theming.primary,), // Icon for username field
                      ),
                      keyboardType: TextInputType.text,

                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your username';
                      //   }
                      //
                      //   return null;
                      // },
                    ),
                  ),

                  SizedBox(height: 30),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.darkBlue) ,
                      controller: _emailController,

                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.secondaryText),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email , color: Theming.primary),
                      ),


                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // if (value == null || value.isEmpty) {
                        //   return 'Please enter your email';
                        // }
                        final RegExp emailRegex = RegExp(
                          r'^[a-zA-Z0-9.]+@gmail\.com$',
                        );
                        if (!emailRegex.hasMatch(value!)) {
                          return 'Please enter a valid Gmail address';
                        }
                        print(_emailController.text);
                        return null;
                      },

                    ),

                  ),


                  SizedBox(height: 30),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.darkBlue) ,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.secondaryText),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock , color: Theming.primary),
                      ),
                      obscureText: true,
                      validator: (value) {
                        // if (value == null || value.isEmpty) {
                        //   return 'Please enter a password';
                        // }

                        // You can add more sophisticated password validation here if needed
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.darkBlue) ,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'phone',
                        labelStyle:Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.secondaryText),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone , color: Theming.primary,),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your phone';
                      //   }
                      //
                      //   // You can add more sophisticated username validation here if needed
                      //   return null;
                      // },
                    ),
                  ),
                  SizedBox(height: 60.0),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                         Navigator.pop(context);
                        },
                        child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: provider.appTheme == ThemeMode.light ? Colors.black : Colors.white
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))
                        ),
                      ),
                      ElevatedButton(onPressed: _submitForm
                        ,
                        child: Text("SAVE", style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white
                        )),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theming.primary,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))
                        ),
                      ),
                    ],
                  )


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
            ],
          ),
        ),
      ),

    );
  }
}
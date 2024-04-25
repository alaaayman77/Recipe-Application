import 'package:final_project/profile_page/profile_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';



class EditProfile extends StatefulWidget{
  const EditProfile({super.key});
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text;

      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return ProfileScreen(name: _usernameController.text,
              email: _emailController.text,
              pass: _passwordController.text,
              phone: _phoneController.text,);
          }));

      print('Email: $email');
      print('Password: $password');
    }
  }

  var name;
  var email;
  var pass;
  var phone;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    ProfileScreen(name: _usernameController.text,
                        email: _emailController.text,
                        pass: _passwordController.text,
                        phone: _phoneController.text)));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 160.0, left: 16.0, right: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person), // Icon for username field
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }

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
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email),
                  ),


                  keyboardType: TextInputType.emailAddress,
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                  ),
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
              SizedBox(height: 30),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'phone',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone';
                    }

                    // You can add more sophisticated username validation here if needed
                    return null;
                  },
                ),
              ),
              SizedBox(height: 60.0),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileScreen(
                              name: _usernameController.text,
                              email: _emailController.text,
                              pass: _passwordController.text,
                              phone: _phoneController.text)));
                    },
                    child: Text("CANCEL",
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black
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
                        backgroundColor: Colors.grey,
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
        ),
      ),

    );
  }
}
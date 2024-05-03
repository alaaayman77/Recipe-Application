import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../theming.dart';
import '../CustomTextField.dart';
import '../sign_in/sign_in.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key:key);
  static const routeName = "ForgotPassword";
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theming.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignIn.routeName);

          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height:200.0), // Adjusted height
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Theming.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60.0),
              Text(
                "Enter your email and we will send a password reset link",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Theming.deepBlue,
                ),
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _emailController,
                label: 'Enter your Email   ',
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 20.0),
              // ElevatedButton(
              //   onPressed: _resetPassword,
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Theming.primary,
              //     padding:   EdgeInsets.symmetric(vertical: 10.0),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12.0),
              //     ),
              //   ),
              //   child:   Text(
              //     'Reset password',
              //     style: TextStyle(
              //       fontSize: 18.0,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Future _resetPassword() async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim(),);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Password reset email sent. Check your inbox.'),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print(e.code);
  //     print(e.message);
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   SnackBar(
  //     //     content: Text('Failed to send reset email: $e'),
  //     //     backgroundColor: Colors.red,
  //     //   ),
  //     // );
  //     print(e);
  //     showDialog(
  //       context: context,
  //       builder: (context){
  //         return AlertDialog(
  //           content: Text(e.message.toString()),
  //         );
  //       },
  //     );
  //   }
  //}

  // Future _resetPassword() async {
  //   try {
  //     // Check if the entered email exists in the user database
  //     var users = await FirebaseAuth.instance.signIpWithEmailAndPassword(email: _emailController.text.trim(),password :_passwordController.text.,context);
  //     if(users.isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('This email is not registered.'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //       return;
  //     }
  //
  //     // If email exists, send password reset email
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Password reset email sent. Check your inbox.'),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print(e.code);
  //     print(e.message);
  //     showDialog(
  //       context: context,
  //       builder: (context){
  //         return AlertDialog(
  //           content: Text(e.message.toString()),
  //         );
  //       },
  //     );
  //   }
  // }

}

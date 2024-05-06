import 'package:final_project/profile_page/profile_page.dart';
import 'package:final_project/profile_page/profile_screen.dart';
import 'package:final_project/provider/Auth_Provider.dart';
import 'package:final_project/provider/app_config_provider.dart';
import 'package:final_project/theming.dart';
import 'package:final_project/transition/transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditNewPassword extends StatefulWidget {
  static const routeName = 'editpassword';

  @override
  State<EditNewPassword> createState() => _EditNewPasswordState();
}

class _EditNewPasswordState extends State<EditNewPassword> {
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _newPasswordController = TextEditingController();

   String oldPassword=ProviderAuth.prefs.getString('password')??"";

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Edit Password" , style: Theme.of(context).textTheme.titleLarge,),
      ),
      body:Form(
        key: formKey,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theming.darkBlue),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theming.secondaryText),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock, color: Theming.primary),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value != oldPassword) {
                      return "enter the old password";
                    }
                    else if (value == null || value.isEmpty) {
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
                    color: Colors.grey[200]),
                child: TextFormField(
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theming.darkBlue),
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    labelText: 'newPassword',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theming.secondaryText),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock, color: Theming.primary),
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
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: provider.appTheme == ThemeMode.light
                              ? Colors.black
                              : Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                  onPressed: () {
                  _changePassword(
                  _passwordController.text,
                  _newPasswordController.text,
                  ProviderAuth.prefs.getString('email'));
                  },
                    child: Text("SAVE",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theming.primary,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  void _changePassword(
       currentPassword, String newPassword, email) async {
    if(formKey.currentState!.validate()){
    final user = await FirebaseAuth.instance.currentUser;
    final cred =
        EmailAuthProvider.credential(email: email, password: currentPassword);
    user?.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('password updated successfully'),
            ));
        Navigator.pop(context);
      });
    });}
  }
}

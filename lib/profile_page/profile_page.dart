import 'package:final_project/profile_page/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "ProfilePage";

   const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ProfileScreen(obsucre: true,),
    );
  }
}

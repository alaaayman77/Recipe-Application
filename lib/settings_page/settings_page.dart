import 'package:final_project/error_model/error_item.dart';
import 'package:final_project/settings_page/settings_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Register/sign_up/sign_up.dart';
import '../theming.dart';
import 'info_screen.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = "SettingsPage";
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void AboutBottomSheet(){
  showModalBottomSheet(context: context, builder: (BuildContext context)=>InfoScreen(content: 'A cookbook or cookery book is a kitchen reference containing recipes.Cookbooks may be general, or may specialize in a particular cuisine ''or category of food.Recipes in cookbooks are organized in various ways: by course (appetizer, first course, main course, dessert), by main ingredient, by cooking technique, alphabetically, '
  'by region or country, and so on. They may include illustrations of finished dishes and preparation steps; discussions of cooking techniques, advice on kitchen equipment, ingredients, tips, and substitutions; historical'
  ' and cultural notes; and so on.Cookbooks may be written by individual authors,'
  ' who may be chefs, cooking teachers, or other food writers; they may be written by collectives; '
  'or they may be anonymous. They may be addressed to home cooks, to professional restaurant cooks, to institutional cooks, or to more specialized audiences.Some cookbooks are didactic, with detailed recipes addressed to beginners '
  'or people learning to cook particular dishes or cuisines;[2] others are simple aide-memoires, which may document the composition of a dish or even precise measurements, but not detailed' ) );

  }
  void ContactUsBottomSheet(){
    showModalBottomSheet(context: context, builder: (BuildContext context)=> InfoScreen(content: '7201 W. 129th St., Ste 160Overland Park. KS 66213 Phone: 913.492.5900  •  800.227.7282 Fax: 913.492.5947Business Hours:Mon.-Fri. 7:45 am – 4:30 pm CST'));
  }
  void ThemingBottomSheet(){
    showModalBottomSheet(context: context, builder: (BuildContext context)=>Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Light Mode' , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.primary),),
                Icon(Icons.check_rounded , color: Theming.primary,)
              ],
            )),
            InkWell(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode' , style: Theme.of(context).textTheme.titleMedium,),
                Icon(Icons.check_rounded)
              ],
            )),

          ],
        ),
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SafeArea(
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SettingsContainer(title: 'About', openBottomSheet: AboutBottomSheet),
              SizedBox(height: 20),
              SettingsContainer(title: 'Contact us', openBottomSheet: ContactUsBottomSheet),
              SizedBox(height: 20),
              SettingsContainer(title: 'Theming', openBottomSheet: ThemingBottomSheet),
              Spacer(),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Logout Confirmation'),
                        content: Text('Are you sure you want to logout?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(SignUp.routeName);

                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theming.primary.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Logout',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.logout_rounded, color: Colors.red, size: 30)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }}

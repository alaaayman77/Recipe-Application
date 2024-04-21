import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theming.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = "SettingsPage";
  const SettingsPage({super.key});

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
          ))),
        ),
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children:
       [  Center(
         child: Container(
             margin: EdgeInsets.all(18.0),
             padding: EdgeInsets.all(8.0),
             decoration: BoxDecoration(
               color: Theming.deepBlue,
               borderRadius: BorderRadius.circular(15),
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                   spreadRadius: 5,
                   blurRadius: 7,
                   offset: Offset(0, 3), // changes position of shadow
                 )
               ],
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   'About',
                   style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                 ),
                 Icon(Icons.arrow_drop_down)
               ],
             )),
       ),
         Center(
           child: Container(
               margin: EdgeInsets.all(18.0),
               padding: EdgeInsets.all(8.0),
               decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor,
                 borderRadius: BorderRadius.circular(15),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                     spreadRadius: 5,
                     blurRadius: 7,
                     offset: Offset(0, 3), // changes position of shadow
                   )
                 ],
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     'About',
                     style: Theme.of(context).textTheme.titleMedium,
                   ),
                   Icon(Icons.arrow_drop_down)
                 ],
               )),
         ),
         Center(
           child: Container(
               margin: EdgeInsets.all(18.0),
               padding: EdgeInsets.all(8.0),
               decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor,
                 borderRadius: BorderRadius.circular(15),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                     spreadRadius: 5,
                     blurRadius: 7,
                     offset: Offset(0, 3), // changes position of shadow
                   )
                 ],
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     'About',
                     style: Theme.of(context).textTheme.titleMedium,
                   ),
                   Icon(Icons.arrow_drop_down)
                 ],
               )),
         ),],)

      ],
    );
  }
}

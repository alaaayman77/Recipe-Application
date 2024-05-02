import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';
import '../theming.dart';

class ThemingggBottomSheet extends StatefulWidget{
  @override
  State<ThemingggBottomSheet> createState() => _ThemingBottomSheetState();
}

class _ThemingBottomSheetState extends State<ThemingggBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
    width: double.infinity,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    InkWell(
    onTap: (){

    provider.changeTheme(ThemeMode.light);
    },
    child: provider.appTheme == ThemeMode.light ? getSelectedWidget('Light') : getUnselectedWidget('Light')
    ),
    InkWell(
    onTap: (){
    provider.changeTheme(ThemeMode.dark);
    },
    child: provider.appTheme == ThemeMode.dark ? getSelectedWidget('Dark') : getUnselectedWidget('Dark')
    ),

    ],
    ),
    ),
    );
  }

  Widget getSelectedWidget(String text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.primary),),
        Icon(Icons.check_rounded , color: Theming.primary,)
      ],
    );
  }

  Widget getUnselectedWidget(String text){
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text , style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.deepBlue)
        ),

      ],
    );
  }
}
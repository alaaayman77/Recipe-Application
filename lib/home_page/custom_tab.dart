import 'package:final_project/theming.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget{
  bool selectedItem;
  var sources;
  CustomTab({super.key, required this.selectedItem,required this.sources});
  @override
  Widget build(BuildContext context) {
return Container(
  padding: const EdgeInsets.symmetric(horizontal:20,vertical:7),
  margin: const EdgeInsets.symmetric(vertical: 10),
  decoration: BoxDecoration(
      color: selectedItem==false ? Theming.form :Theming.primary,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
          width:3,
          color: selectedItem==false ? Theming.form : Theming.primary)),
  child: Text(sources,
      style:Theme.of(context).textTheme.bodySmall!.copyWith(
        fontWeight: selectedItem==true?FontWeight.bold:FontWeight.w500,
          fontSize: 18,
          color:selectedItem==false?Theming.secondaryText:Theming.white
      )),
);
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../provider/app_config_provider.dart';
import '../theming.dart';


class Instruction extends StatelessWidget{
  String? title;
  List<dynamic>? instructions;

  Instruction({required this.title , required this.instructions});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
     Text(title ??'' ,  style:Theme.of(context).textTheme.titleMedium)
     ,
     if (instructions != null)
       ListView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemCount: instructions?.length,
           itemBuilder: (context, index) {
             var instruction = instructions?[index];
             var stepTexts = [];
             List<dynamic>? steps = instruction.steps;
             if (steps != null && steps.isNotEmpty) {
               stepTexts = steps.map((step) {
                 return 'Step ${step.number}\n${step.step}';
               }).toList();
             }
             return ReadMoreText(
               stepTexts.join('\n\n'),
               trimMode: TrimMode.Line,
               trimLines: 5,
               colorClickableText: provider.appTheme==ThemeMode.dark ? Theming.white: Theming.deepBlue,
               trimCollapsedText: 'Show more',
               trimExpandedText: 'Show less',
               style: Theme.of(context)
                   .textTheme
                   .bodyMedium,
             );
           }),
     Divider(
       thickness: 0.5,
       color: Theming.deepBlue,
     ),
   ],);
  }
}
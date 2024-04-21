
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../theming.dart';

class DetailsContainers extends StatelessWidget{
  String? title;
  String? desc;
  DetailsContainers({required this.title ,  this.desc});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     Text(title ??'' , style :Theme.of(context).textTheme.titleMedium ),
      SizedBox(height: 5,),
        ReadMoreText(
          desc??'',
          trimMode: TrimMode.Line,
          trimLines: 3,
          colorClickableText: Theming.deepBlue,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      Divider(thickness: 0.5, color: Theming.deepBlue,),
    ],);
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  String title;
  String description;
  String image;
   IntroPage({super.key,required this.image,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer(flex: 2,),
            Lottie.network(image
            ,width: 500,
              height: 400
            ),
            Text(title,style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text(description,textAlign: TextAlign.center),
            // Spacer(flex: 2,),

          ],
        ),
      );
  }
}

import 'package:final_project/Register/sign_in/sign_in.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/introduction_screen/into_page.dart';
import 'package:final_project/theming.dart';
import 'package:final_project/transition/transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
   const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController controller = PageController();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (pageNumber){
                setState(() {
        
                });
                lastPage = (pageNumber==2);
              },
              children: [
                IntroPage(image: "https://lottie.host/57f31354-75a0-4b76-ba5e-e515e0f64acb/7DVckPrrnl.json",
                    title: "Discover hundreds of recipes",
                    description: "Discover new tastes to prepare at home,your culinary adventure begins!"),

                IntroPage(image: "https://lottie.host/a600bee5-30e8-4552-9ae7-58eb8fd05fec/tzFkZf8b3R.json",
                    title: "Search with name",
                    description: "from recipe name find your recipe and see its preparation steps, calories ,.."),

                IntroPage(image: "https://lottie.host/ca6b1a71-ea5c-4362-804c-95a73051de70/f1aJscgHgl.json", title: "Register to Save own recipes", description: "when you register you can save own favorite recipe"),

              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){
                        controller.jumpToPage(2);
                      }, child:Text("Skip",style: Theme.of(context).textTheme.titleSmall,) ),
                      SmoothPageIndicator(controller: controller, count: 3),

                      lastPage?
                      TextButton(onPressed: (){
                        Navigator.pushReplacementNamed(context, SignIn.routeName);
                      }, child: Text("Done",style:Theme.of(context).textTheme.titleSmall,))
                      :TextButton(onPressed: (){
                        controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                        }, child: Text("Next",style: Theme.of(context).textTheme.titleSmall,))

                    ],
                  )),
            )
          ],
        ),
      ),
    );

  }
}

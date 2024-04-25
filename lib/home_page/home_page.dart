import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Api/api_manager.dart';
import 'package:final_project/error_model/error_item.dart';
import 'package:final_project/firebase_utils/FirebaseUtils.dart';
import 'package:final_project/home_page/custom_tab.dart';
import 'package:final_project/home_page/recipe_info.dart';
import 'package:final_project/home_page/recipe_image.dart';
import 'package:final_project/home_page/save_item.dart';
import 'package:final_project/loading_effect/homeLoading.dart';
import 'package:final_project/loading_effect/image_loading.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:final_project/search/custom_search.dart';
import 'package:final_project/theming.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../recipe_description/recipe_details.dart';

class HomePage extends StatefulWidget {
  static const routeName = "HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List<String> dishTypes = [
    "All",
    "main course",
    "side dish",
    "dessert",
    "appetizer",
    "salad",
    "breakfast",
    "lunch",
    "dinner"
  ];
  int selected = 0;
  // bool isFavorite = false;
  @override
  Widget build(BuildContext context) {

    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            // maintainBottomViewPadding: false,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.20 ,
              color:Theming.white ,
              child:Column(
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                              Icons.person,
                              color: Theming.secondaryText,
                              size:35
                          )),
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          onTap: (){
                            showSearch(context: context, delegate:CustomSearch());
                            setState(() {

                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                              hintText: "Search",
                              hintStyle:TextStyle(color: Theming.secondaryText,fontSize:20) ,
                              prefixIcon: Icon(Icons.search,size:30,color:Theming.secondaryText),
                              filled: true,
                              fillColor: Theming.form,
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none)
                          ),

                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  DefaultTabController(

                    length: dishTypes.length,
                    child: TabBar(
                      indicator: null,
                        onTap: (index) {
                          selected = index;
                          setState(() {});
                        },
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        tabs:
                        dishTypes
                            .map((source) => CustomTab(
                            selectedItem:
                            selected == dishTypes.indexOf(source)
                                ? true
                                : false,
                            sources: dishTypes[dishTypes.indexOf(source)]))
                            .toList()
                    ),
                  ),

                ],
              ),

            ),

          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("Popular Recipes",style: Theme.of(context).textTheme.titleLarge,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
              child: FutureBuilder<RandomRecipeResponse?>(
                  future: ApiManager.getRandomRecipe(tags:selected==0?"":dishTypes[selected]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => const HomeLoading(),
                        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing:10,
                          childAspectRatio: 1,
                        ),
                      );

                      //   I have error
                    } else if (snapshot.hasError) {
                      return Center(
                        child: ErrorItem(errormessage: "something want wrong",error: (){
                          ApiManager.getRandomRecipe();
                          setState(() {
                          });
                        },),
                      );
                    }

                    // Error from API
                    if (snapshot.data?.status == 'failure') {
                      return Center(
                        child:  ErrorItem(errormessage:snapshot.data?.message,error: (){
                          ApiManager.getRandomRecipe();
                          setState(() {
                          });
                        }, ),
                      );

                    }
                    var recipes = snapshot.data?.recipes;

                    return
                      GridView.builder(
                          itemCount: recipes?.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){

                                Navigator.of(context).pushNamed(RecipeDetails.routeName ,arguments : recipes?[index]);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      RecipeImage(id: recipes?[index].id,dim: "636x393"),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: saveItem(recipe:recipes?[index]),
                                      ),
                                    ],
                                  ),
                                  RecipeInfo(recipe: recipes?[index]),
                                ],
                              ),
                            );
                          });


                  }),
            ),
          )
        ],

      );




  }
}
import 'package:final_project/firebase_utils/FirebaseUtils.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:final_project/model/myUser.dart';
import 'package:final_project/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class saveItem extends StatefulWidget {
  Recipes? recipe;

  saveItem({super.key,required this.recipe});

  @override
  State<saveItem> createState() => _saveItemState();
}

class _saveItemState extends State<saveItem> {

  bool isFavorite = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var provider=Provider.of<FavoriteProvider>(context);
     final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    if(provider.recipes.isEmpty){
      provider.getRecipesFromFireStore(arguments["id"]);
    }
    isFavorite=provider.checkExist(widget.recipe!);
  }
  // bool isFavorite = false;

  @override
  Widget build(BuildContext context) {

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    var provider = Provider.of<FavoriteProvider>(context);
    return
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          // color: const Color.fromRGBO(0, 0, 0, 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: (){
            provider.onClickedRecipe(widget.recipe!,isFavorite,arguments["id"]);
            print("===========================");
            print(arguments["id"]);
          },
          child: Center(
            child :provider.checkExist(widget.recipe!)?Icon(Icons.favorite,color: Colors.red):Icon(Icons.favorite_border_rounded,color: Colors.black)),
        ));
  }
  
}

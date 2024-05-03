import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/firebase_utils/FirebaseUtils.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:flutter/cupertino.dart';

class FavoriteProvider extends ChangeNotifier{
  List<Recipes> recipes = [];

  Future<void> getRecipesFromFireStore(String uid)async{
    QuerySnapshot<Recipes> querySnapshot= await FirebaseUtils.getRecipeCollection(uid).get();
    // List<QueryDocumentSnapshot<Recipes>> => list <task>
    recipes=querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
   notifyListeners();
  }

  bool checkExist(Recipes recipe){
    for(int i =0 ;i<recipes.length;i++)
      {
        if(recipe.id == recipes[i].id)
          {
            return true;
          }
      }
    return false;
  }

  onClickedRecipe(Recipes recipe,bool isFavorite,String uid)async{
    if (isFavorite==false) {
      isFavorite=true;
      await FirebaseUtils.addFavoriteRecipe(recipe,uid).timeout(const Duration(seconds: 2), onTimeout: () {
        print("added succefully"); // Prints "timeout" after 2 seconds.
      });
      await getRecipesFromFireStore(uid);

    } else {
      isFavorite=false;
      await FirebaseUtils.deleteFavoriteRecipe(recipe,uid).timeout(const Duration(seconds: 2), onTimeout: () {
        print("deleted succefully"); // Prints "timeout" after 2 seconds.
      });
      await getRecipesFromFireStore(uid);
    }
  }
}
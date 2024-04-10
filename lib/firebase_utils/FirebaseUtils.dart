//Class have all firebase functions
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';

class FirebaseUtils{
  // method to get recipe collection from firebase
  static CollectionReference<Recipes> getRecipeCollection(){
    // Create a CollectionReference called recipe that references the firestore collection
    // FirebaseFirestore.instance=> object of firebase
    return FirebaseFirestore.instance.collection('recipe')
    // make object has type
        .withConverter<Recipes>(
      // come to you as object
      // snapshot => data
      // options firebase options if u want to add any options that firebase provide to u
      fromFirestore: (snapshot, options) => Recipes.fromJson(snapshot.data()!),
      // go to firebase as map
      toFirestore: (recipes, options) => recipes.toJson(),);

  }

  static Future<void> addFavoriteRecipe(Recipes recipe){
    var recipeCollection = getRecipeCollection();
    var docRef = recipeCollection.doc(recipe.id.toString());
    return docRef.set(recipe);
  }

  static Future<void> deleteFavoriteRecipe(Recipes recipe){
    var recipeCollection = getRecipeCollection();
    var docRef = recipeCollection.doc(recipe.id.toString());
    return docRef.delete();
  }


}
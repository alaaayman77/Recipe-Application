 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Register/sign_up/sign_up.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:final_project/model/myUser.dart';
import 'package:final_project/provider/Auth_Provider.dart';
import 'package:final_project/transition/transition.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';



import '../Register/sign_in/sign_in.dart';

class FirebaseUtils{

  // method to get recipe collection from firebase

  static CollectionReference<Recipes> getRecipeCollection(){
    // Create a CollectionReference called recipe that references the firestore collection
    // FirebaseFirestore.instance=> object of firebase
    return getUserCollection().doc(ProviderAuth.prefs.getString('id')??"").collection('recipe')
    // make object has type
        .withConverter<Recipes>(
      // come to you as object
      // snapshot => data
      // options firebase options if u want to add any options that firebase provide to u
      fromFirestore: (snapshot, _) => Recipes.fromJson(snapshot.data()!),
      // go to firebase as map
      toFirestore: (recipes, _) => recipes.toJson(),);

  }

  static Future<void> addFavoriteRecipe(Recipes recipe){
    // var recipeCollection = getRecipeCollection();
    // var docRef = recipeCollection.doc(recipe.id.toString());
    // return docRef.set(recipe);
    return getRecipeCollection().doc(recipe.id.toString()).set(recipe);
  }

  static Future<void> deleteFavoriteRecipe(Recipes recipe){
    var recipeCollection = getRecipeCollection();
    var docRef = recipeCollection.doc(recipe.id.toString());
    return docRef.delete();
  }

  // USe with sign up
  static Future<void> addUserToFirestore(MyUser myUser){
    var userCollection = getUserCollection();
    var docRef = userCollection.doc(myUser.id);
    return docRef.set(myUser);
  }

   // private to never used outside this class
   static FirebaseAuth _auth = FirebaseAuth.instance;
 static Future<User?> signUpWithEmailAndPassword(String email,
      String password,context,String userName) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      MyUser myUser = MyUser(id: credential.user?.uid ??"", email: email, userName: userName);
      addUserToFirestore(myUser);
      // var authProvider = Provider.of<ProviderAuth>(context,listen: false);
      // authProvider.updateNewUser(myUser);

      Navigator.pushReplacementNamed(context, SignIn.routeName);
      return credential.user;

     } catch (e) {
       //print('Registration error: $e');
       // Show an error message to the user
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           content: Text('Registration failed. Please try another email or login .'),
           backgroundColor: Colors.red,
         ),
       );
    }

    return null;
  }

  static  CollectionReference<MyUser> getUserCollection(){
    return FirebaseFirestore.instance.collection("users").withConverter<MyUser>
      (
        fromFirestore: (snapshot, _) => MyUser.fromFireStore(snapshot.data()!),
        toFirestore: (myUser, _) => myUser.toFireStore(),
    );
  }




//   USe with sign in

 static Future<MyUser?> readUser (String uid)async{
   var snapShot = await getUserCollection().doc(uid).get();
   // data => user
   return snapShot.data() ;
 }

 static Future<void> updateUserProfile({required String uid,String name=''})async{
   var snapshot= await getUserCollection().doc(uid).update(
     {
       "name":name,
     }
   );

   ProviderAuth.prefs.setString('name',name);
 }
  static Future<User?> signInWithEmailAndPassword(
      String email, String password, context) async {

    // authProvider.myUser=null;
    try {

      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

       var User=await readUser(credential.user?.uid??"");
//
//       print('-----------------------------');
//       print(User?.userName);
//       print('-------------');
      // print('${credential.user}');
      var authProvider = Provider.of<ProviderAuth>(context,listen: false);
      authProvider.updateNewUser(User);
      Navigator.pushReplacementNamed(context, Transition.routeName,);
      return credential.user;
    } catch (e) {
      //print('Registration error: $e');
      // Navigator.pushReplacementNamed(context, SignUp.routeName);
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Log In failed. Please try another email or Sign Up new Email .'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

}
import 'dart:convert';
import 'package:final_project/Api/api_constants.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:final_project/model/SearchRecipe.dart';
import 'package:final_project/model/SimilarRecipeResponse.dart';
import 'package:http/http.dart' as http;


class ApiManager{

  static Future<RandomRecipeResponse?> getRandomRecipe({tags='' }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.randomRecipeApi,
        {
          //"apiKey":"d6bc8f232b984351a3dac4324ea2227d",
          //"apiKey":"d6bc8f232b984351a3dac4324ea2227d",
          "apiKey":"1abadcbcdec042f2a1dc22b1c4499ce5",
        //  "apiKey":"1abadcbcdec042f2a1dc22b1c4499ce5",
       //  "apiKey":"d35ade602f354e3f8579b17700a20155",
         // "apiKey":"a9fe397ef4cc4d28a722da6d469f8c71",
        //   "apiKey": "73f34b466856436e978b5cc90412f0d0",
       // "apiKey":"73f34b466856436e978b5cc90412f0d0",
        // "apiKey":"9d23519846b7487ebb193fcb64c83c74",
          "number":"20",
          "tags":tags ,
        });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RandomRecipeResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
  static Future<SearchRecipe?> getSearchRecipe({query=''}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.searchRecipeApi,
        {
          //"apiKey": "d6bc8f232b984351a3dac4324ea2227d",
        //  "apiKey":"d6bc8f232b984351a3dac4324ea2227d",
       // "apiKey":"d35ade602f354e3f8579b17700a20155",
         "apiKey":"1abadcbcdec042f2a1dc22b1c4499ce5",
        //  "apiKey":"a9fe397ef4cc4d28a722da6d469f8c71",
      //    "apiKey": "73f34b466856436e978b5cc90412f0d0",
        // "apiKey":"d6bc8f232b984351a3dac4324ea2227d",
       //  "apiKey":"9d23519846b7487ebb193fcb64c83c74",
          "query":query
        });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SearchRecipe.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
  static Future<SimilarList> getSimilarRecipe(num? recipeId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.similarRecipeApi.replaceAll('{id}', '${recipeId}'),
        {
         //  "apiKey":"73f34b466856436e978b5cc90412f0d0",
         // "apiKey":"d6bc8f232b984351a3dac4324ea2227d",
          //"apiKey":"d35ade602f354e3f8579b17700a20155",
           "apiKey":"1abadcbcdec042f2a1dc22b1c4499ce5",
           //"apiKey": "73f34b466856436e978b5cc90412f0d0",
          //"apiKey":"a9fe397ef4cc4d28a722da6d469f8c71",
         //"apiKey":"d6bc8f232b984351a3dac4324ea2227d",
          // "apiKey":"9d23519846b7487ebb193fcb64c83c74",
          "id" :'$recipeId'

        });

    try {
      var response = await http.get(url);
      var bodyString = response.body ;
      var json = jsonDecode(bodyString);
      return  SimilarList.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }


}
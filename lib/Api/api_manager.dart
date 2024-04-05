import 'dart:convert';
import 'package:final_project/Api/api_constants.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:http/http.dart' as http;


class ApiManager{

  static Future<RandomRecipeResponse?> getRandomRecipe({tags=''}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.randomRecipeApi,
        {
          "apiKey":"d6bc8f232b984351a3dac4324ea2227d",
          // "apiKey": "73f34b466856436e978b5cc90412f0d0",
          "number":"100",
          "tags":tags
        });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RandomRecipeResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

}
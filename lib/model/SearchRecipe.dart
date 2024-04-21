/// results : [{"id":782585,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"https://img.spoonacular.com/recipes/782585-312x231.jpg","imageType":"jpg"},{"id":715497,"title":"Berry Banana Breakfast Smoothie","image":"https://img.spoonacular.com/recipes/715497-312x231.jpg","imageType":"jpg"},{"id":715415,"title":"Red Lentil Soup with Chicken and Turnips","image":"https://img.spoonacular.com/recipes/715415-312x231.jpg","imageType":"jpg"},{"id":716406,"title":"Asparagus and Pea Soup: Real Convenience Food","image":"https://img.spoonacular.com/recipes/716406-312x231.jpg","imageType":"jpg"},{"id":644387,"title":"Garlicky Kale","image":"https://img.spoonacular.com/recipes/644387-312x231.jpg","imageType":"jpg"},{"id":715446,"title":"Slow Cooker Beef Stew","image":"https://img.spoonacular.com/recipes/715446-312x231.jpg","imageType":"jpg"},{"id":782601,"title":"Red Kidney Bean Jambalaya","image":"https://img.spoonacular.com/recipes/782601-312x231.jpg","imageType":"jpg"},{"id":795751,"title":"Chicken Fajita Stuffed Bell Pepper","image":"https://img.spoonacular.com/recipes/795751-312x231.jpg","imageType":"jpg"},{"id":716426,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"https://img.spoonacular.com/recipes/716426-312x231.jpg","imageType":"jpg"},{"id":766453,"title":"Hummus and Za'atar","image":"https://img.spoonacular.com/recipes/766453-312x231.jpg","imageType":"jpg"}]
/// offset : 0
/// number : 10
/// totalResults : 5216

class SearchRecipe {
  SearchRecipe({
    this.message,
    this.code,
    this.status,
      this.results, 
      this.offset, 
      this.number, 
      this.totalResults,});

  SearchRecipe.fromJson(dynamic json) {
    code =json['code'];
    message =json['message'];
    status =json['status'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }
  String? message;
  String? status;
  num? code;
  List<Results>? results;
  num? offset;
  num? number;
  num? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['offset'] = offset;
    map['number'] = number;
    map['totalResults'] = totalResults;
    return map;
  }

}

/// id : 782585
/// title : "Cannellini Bean and Asparagus Salad with Mushrooms"
/// image : "https://img.spoonacular.com/recipes/782585-312x231.jpg"
/// imageType : "jpg"

class Results {
  Results({

      this.id, 
      this.title, 
      this.image, 
      this.imageType,});

  Results.fromJson(dynamic json) {

    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
  }

  int? id;
  String? title;
  String? image;
  String? imageType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['imageType'] = imageType;
    return map;
  }

}
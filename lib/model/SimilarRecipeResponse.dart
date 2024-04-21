class Similar {
  final int? id;
  final String? name;
  final String? image;
  final int? readyInMinutes;
  final int? servings;


  Similar({

     this.id,
   this.name,
    this.image,
    this.readyInMinutes,
    this.servings,
  });
  factory Similar.fromJson(json) {

    return Similar(


      id: json['id'],
      name: json['title'] ?? '',
      image:
      "https://spoonacular.com/recipeImages/${json['id']}-556x370.${json['imageType']}",
      readyInMinutes: json['readyInMinutes'],
      servings: json['servings'],
    );
  }
}

class SimilarList {
  String? message;
  String? status;
  num? code ;
  final List<Similar> list;
  SimilarList({
    this.message,
    this.code,
    this.status,
    required this.list,
  });

  factory SimilarList.fromJson(List<dynamic> json) {
    return SimilarList(

      list: json.map((data) => Similar.fromJson(data)).toList(),
    );
  }}
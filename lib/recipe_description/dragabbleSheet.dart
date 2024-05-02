import 'package:final_project/recipe_description/details_containers.dart';
import 'package:final_project/recipe_description/instructions.dart';
import 'package:final_project/recipe_description/recipe_container.dart';
import 'package:final_project/recipe_description/similar_recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/RandomRecipeResponse.dart';
import 'package:html/parser.dart' as html_parser;

import '../provider/app_config_provider.dart';
import '../theming.dart';
import 'ingredients.dart';

class DragabbleSheet extends StatefulWidget {
  Recipes? args;
  List<dynamic>? ingredients;
  List<dynamic>? instructions;

  DragabbleSheet({
    required this.args,
    required this.ingredients,
    required this.instructions,
  });

  @override
  State<DragabbleSheet> createState() => _DragabbleSheetState();
}

class _DragabbleSheetState extends State<DragabbleSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.65, // Start at 65% of the screen height
      minChildSize: 0.65, // Sheet will always be at least 65% of the screen height
      maxChildSize: 1.0, // Sheet can be maximized to full screen height
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
            decoration: BoxDecoration(
                color: provider.appTheme==ThemeMode.dark?Theming.darkBlue:Theming.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 5,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(3)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.args?.title ?? '',
                              style: Theme.of(context).textTheme.titleLarge),
                          SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RecipeContainer(args: widget.args),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DetailsContainers(
                              title: 'Dish Types',
                              desc: widget.args?.dishTypes?.join(' , ') ?? " "),
                          DetailsContainers(
                            title: 'Description',
                            desc: cleanSummary(widget.args?.summary ?? ''),
                          ),
                          Ingredient(
                            title: 'Ingredients',
                            ingredients: widget.ingredients,
                          ),
                          Instruction(
                            title: 'Instructions',
                            instructions: widget.instructions,
                          ),

                          Text(
                            'Similar Recipes',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SimilarRecipe(args: widget.args)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  String cleanSummary(String summary) {
    // Parse the HTML to text
    final document = html_parser.parse(summary);
    final text = document.body?.text ?? '';

    // Remove URLs from the text using a regular expression
    final cleanedText =
        text.replaceAllMapped(RegExp(r'(https?://[^\s]+)'), (match) => '');

    return cleanedText.trim(); // Trim any leading or trailing whitespace
  }
}

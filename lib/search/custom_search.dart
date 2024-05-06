

import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/search/search_results.dart';
import 'package:final_project/theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearch extends SearchDelegate {
@override
  // TODO: implement searchFieldStyle
//   TextStyle? get searchFieldStyle {
//   return
// };



  // @override
  // // TODO: implement searchFieldDecorationTheme
  // InputDecorationTheme? get searchFieldDecorationTheme {
  //   return InputDecorationTheme(
  //     focusColor:Colors.red,
  //       filled: true,
  //       fillColor:Colors.red,
  //       enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(style: BorderStyle.none)),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)));
  // }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // searchFieldDecorationTheme;
    return ThemeData(
      scaffoldBackgroundColor: Theming.form,
      appBarTheme: AppBarTheme(
          toolbarHeight: MediaQuery
              .sizeOf(context)
              .height * 0.2,
          elevation: 0,
          color: Theming.form),

    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          splashRadius: 1,
          onPressed: () {
            query = "";
          },
          icon: Container(
            padding: EdgeInsets.all(3),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Theming.deepBlue),
            child: Icon(
              size: 16,
              Icons.close_rounded,
              color: Theming.white,
            ),
          )),

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        // constraints: BoxConstraints.loose(Size.zero),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Theming.deepBlue,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {

    // @override
    // ThemeData appBarTheme(BuildContext context) {
    //   searchFieldDecorationTheme;
    //   return ThemeData(
    //     scaffoldBackgroundColor: Theming.form,
    //     backgroundColor: Theming.form,
    //     appBarTheme: AppBarTheme(
    //         toolbarHeight: MediaQuery
    //             .sizeOf(context)
    //             .height * 0.2,
    //         elevation: 0,
    //         color: Theming.form),
    //   );
    // }

    if (query.isNotEmpty) {
      return SearchResults(query: query);
    } else {
      return Center(
        child: Text("no item found",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theming.primary)),
      );

    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}

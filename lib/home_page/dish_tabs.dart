import 'package:final_project/home_page/custom_tab.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/theming.dart';
import 'package:flutter/material.dart';

class DishTabs extends StatefulWidget{
  List<String> dishTypes = [
    "All",
    "main course",
    "side dish",
    "dessert",
    "appetizer",
    "salad",
    "breakfast",
    "lunch",
    "dinner"
  ];
  int selected = 0;


  @override
  State<DishTabs> createState() => _DishTabsState();
}

class _DishTabsState extends State<DishTabs> {
  @override
  Widget build(BuildContext context) {
return Container(
  height: MediaQuery.sizeOf(context).height * 0.23 ,
  color:Theming.white ,
  child:Column(
    children: [
      SizedBox(height: 10,),
      Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                  Icons.person,
                  color: Theming.secondaryText,
                  size:35
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: TextFormField(
                onTap: (){
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                    hintText: "Search",
                    hintStyle:TextStyle(color: Theming.secondaryText,fontSize:20) ,
                    prefixIcon: Icon(Icons.search,size:30),
                    filled: true,
                    fillColor: Theming.form,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none)
                ),

              ),
            ),
          ),

        ],
      ),
      SizedBox(height: 10,),
      DefaultTabController(
        length: widget.dishTypes.length,
        child: TabBar(
            onTap: (index) {
              widget.selected = index;
              HomePage(dishTypes:widget.dishTypes,selected:widget.selected,);
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs:
            widget.dishTypes
                .map((source) => CustomTab(
                selectedItem:
                widget.selected == widget.dishTypes.indexOf(source)
                    ? true
                    : false,
                sources: widget.dishTypes[widget.dishTypes.indexOf(source)]))
                .toList()
        ),
      )


    ],
  ),
); }
}
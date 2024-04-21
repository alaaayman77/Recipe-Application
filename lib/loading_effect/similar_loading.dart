import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimilarLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
      ),
    ),
    const SizedBox(height: 10,),
    Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade200,
    child: Container(
    height: 10,
    width: 120,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
    color: Colors.white,
    ),
    ),
    ) ]);

  }

}
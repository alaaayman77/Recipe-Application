import 'package:flutter/material.dart';

class ErrorItem extends StatefulWidget {
  String? errormessage;
  // VoidCallback
    final void Function() error;
  ErrorItem({super.key, required this.errormessage,required this.error});

  @override
  State<ErrorItem> createState() => _ErrorItemState();
}

class _ErrorItemState extends State<ErrorItem> {
  @override
  Widget build(BuildContext context) {
    return
         Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 0, 0, 0.2),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 50.0,
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Error Occurred!',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.errormessage ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: widget.error,
                    child: const Text(
                      "Try Again",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
          ),
        ));
  }
}

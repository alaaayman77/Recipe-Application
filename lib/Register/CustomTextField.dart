import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  bool? hidden;
  IconData? hiddenIcon;
  Widget? iconButton;
    CustomTextField({
    Key? key,
     this.hidden,
     this.iconButton,
     this.hiddenIcon,
    required this.controller,
      this.label,
      this.prefixIcon,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: TextFormField(

        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon:widget.iconButton ,
          labelText: widget.label,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          border: InputBorder.none,
          prefixIcon: Icon(widget.prefixIcon),
        ),
        obscureText:widget.hidden ?? false,
        validator: widget.validator,
      ),
    );
  }
}

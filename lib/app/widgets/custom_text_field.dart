import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData? suffixIcon;
  final bool passField;
  final String? Function(String?)? validator;
  const CTextField({Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.validator,
    this.passField = false
  }) : super(key: key);

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {

  bool passShow = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Get.textTheme.subtitle2,
      validator: widget.validator,
      obscureText: widget.passField ? passShow : false,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: widget.passField ? (){
            setState(() {
              passShow = !passShow;
            });
          } : (){},
          icon: Icon(
            widget.passField ? passShow ? Icons.remove_red_eye_outlined : CupertinoIcons.eye_slash :  widget.suffixIcon,
            size: 18,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.black26
          )
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        label: Text(
          widget.labelText
        ),
        hintStyle: TextStyle(
            color: Colors.grey.shade500
        ),
        filled: true,
        fillColor: Colors.white
      ),
    );
  }
}
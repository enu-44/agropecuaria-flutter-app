// ignore_for_file: prefer_const_constructors

import 'package:agropecuariosapp/consts.dart';
import 'package:flutter/material.dart';


class InputCredential extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final IconData? icons;

  const InputCredential({ 
    Key? key, 
    this.controller,
    this.isPasswordField,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.icons,
    }) : super(key: key);

  @override
  State<InputCredential> createState() => _InputCredentialState();
}

class _InputCredentialState extends State<InputCredential> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.35),
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        cursorColor: Palette.kSecondaryColor,
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Palette.kSecondaryColor
          ),
          labelText: widget.labelText,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Palette.kSecondaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child:
            widget.isPasswordField==true? 
            Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: _obscureText == false ? Colors.black : Palette.kSecondaryColor,) 
            : Icon(widget.icons)
            // CustomSurffixIcon(svgIcon: widget.iconString != null  ? icon.toString() : ''),
          ),
        ),
      ),
    );
  }
}
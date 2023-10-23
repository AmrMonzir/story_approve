import 'package:flutter/material.dart';

const inputDecoration = InputDecoration(
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    hintText: 'Enter a value',
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
    ),
    prefixIconColor: primaryColor,
    focusColor: primaryColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
    ),
    disabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)));

const primaryColor = Colors.teal;

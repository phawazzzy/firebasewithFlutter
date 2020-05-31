import 'package:flutter/material.dart';

const KTextInputDecoration =  InputDecoration(
  hintText: '',
  fillColor: Colors.white,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.pink,
      width: 2.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFFFFFFF),
      width: 2.0,
    )
  )
);
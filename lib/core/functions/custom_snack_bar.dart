import 'package:flutter/material.dart';

void customSnackBar(String text,context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
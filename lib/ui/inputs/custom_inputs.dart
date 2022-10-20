import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3))),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.black),
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: Colors.black),
    );
  }

  static searchInputDecoration(
      {required String hint, required IconData icon}) {}
}

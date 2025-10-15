import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Opacity(
          opacity: 0.8,
          child: Image.asset(AssestData.icSearch),
        ),
        focusedBorder: buildOutlinedInputBorder(),
        enabledBorder: buildOutlinedInputBorder(),
        hintText: 'Search',
      ),
    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
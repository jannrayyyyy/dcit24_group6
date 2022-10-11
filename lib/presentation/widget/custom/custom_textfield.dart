import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(5),
      child: TextField(
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
        ),
        controller: controller,
      ),
    );
  }
}

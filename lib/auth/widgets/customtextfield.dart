// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebaselearn/core/colors.dart';
import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final Widget preIcon;
  final String text;
  final String hintText;

  const Customtextfield({
    super.key,
    required this.controller,
    required this.obscure,
    required this.preIcon,
    required this.text,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      // onChanged: (value) {
      //   print();
      // },

      // onSubmitted: (value) {
      //   print();
      // },
      style: TextStyle(fontSize: 16, color: AppColors.secondaryBlack),
      textAlign: TextAlign.start,

      cursorColor: AppColors.secondaryBlack,
      cursorWidth: 2.0,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        prefixIcon: preIcon,
        labelText: text,
        labelStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.secondaryBlack,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: AppColors.secondaryBlack, width: 1.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.secondaryBlack, width: 1.5),
        ),
      ),
    );
  }
}

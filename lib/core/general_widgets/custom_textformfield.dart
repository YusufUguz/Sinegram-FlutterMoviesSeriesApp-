import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.icon,
      required this.labelText,
      required this.textEditingController,
      this.validator,
      this.obsecureText = false,
      this.keyboardType});

  String labelText;
  IconData icon;
  TextEditingController textEditingController;
  String? Function(String?)? validator;
  bool obsecureText;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obsecureText,
        validator: validator,
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          prefixIconColor: Constants.appsLighterMainColor,
          enabledBorder: Constants.border,
          border: Constants.border,
          labelText: labelText,
        ),
      ),
    );
  }
}

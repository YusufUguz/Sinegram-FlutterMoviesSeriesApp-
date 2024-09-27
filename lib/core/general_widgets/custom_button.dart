import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  String text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color(0xFFA1C9FF)),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: const TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

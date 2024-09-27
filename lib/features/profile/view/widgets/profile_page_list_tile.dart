import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ProfilePageListTile extends StatelessWidget {
  ProfilePageListTile({super.key, required this.text, required this.icon});

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      leading: Icon(
        icon,
        color: const Color(0xFFA1C9FF),
      ),
      trailing: const Icon(
        FontAwesomeIcons.chevronRight,
        color: Color(0xFFA1C9FF),
      ),
    );
  }
}

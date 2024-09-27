import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

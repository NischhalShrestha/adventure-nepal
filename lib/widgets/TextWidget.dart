import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final dynamic text;
  const TextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      textAlign: TextAlign.center,
    );
  }
}

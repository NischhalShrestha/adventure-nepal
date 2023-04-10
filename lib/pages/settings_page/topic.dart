import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  final String topic;
  const Topic({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        alignment: Alignment.centerLeft,
        child: Text(
          topic,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ));
  }
}

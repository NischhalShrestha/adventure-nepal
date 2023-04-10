import 'package:flutter/material.dart';

class IndividualComponent extends StatelessWidget {
  final String title;
  final String option;
  final String imagePath;

  const IndividualComponent({
    Key? key,
    required this.title,
    required this.option,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(imagePath),        
        const SizedBox(
          width: 15,
        ),
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const Spacer(),
        Text(
          option,
          textAlign: TextAlign.right,
          style: const TextStyle(color: Color(0xffa2a2b5), fontSize: 12),
        ),
        const SizedBox(
          width: 5,
        ),


       
        const Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: Color(0xffa2a2b5),
        )
      ],
    );
  }
}

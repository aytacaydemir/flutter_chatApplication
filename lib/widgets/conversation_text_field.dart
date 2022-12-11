import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  const TxtField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(25), right: Radius.circular(25))),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'mesaj yssaz',
          ),
        ),
      ),
    );
  }
}

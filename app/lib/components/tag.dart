import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tagName;

  const Tag({
    required this.tagName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xffB49AFF),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              tagName.toUpperCase(),
              style: const TextStyle(
                color: Color(0xff22212C),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

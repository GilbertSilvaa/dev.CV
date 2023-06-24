import 'package:flutter/material.dart';

class DeveloperProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String position;

  const DeveloperProfileCard({
    required this.imagePath,
    required this.name,
    required this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF2C2A42),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffB49AFF), width: 2),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xffB49AFF),
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              position,
              style: const TextStyle(
                color: Color(0xffB49AFF),
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

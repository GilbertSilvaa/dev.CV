import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class DeveloperCard extends StatelessWidget {
  final String avatarImagePath;
  final String developerName;
  final String position;
  final String location;
  final List<String> tags;

  const DeveloperCard({
    required this.avatarImagePath,
    required this.developerName,
    required this.position,
    required this.location,
    required this.tags,
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xffB49AFF), width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(avatarImagePath),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      developerName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB49AFF),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      position,
                      style: const TextStyle(
                        color: Color(0xffB49AFF),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          FeatherIcons.mapPin,
                          size: 16,
                          color: Color(0xffB49AFF),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          location,
                          style: const TextStyle(
                            color: Color(0xffB49AFF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < tags.length && i < 3; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffB49AFF),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: Center(
                          child: Text(
                            tags[i].toUpperCase(),
                            style: const TextStyle(
                              color: Color(0xff22212C),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

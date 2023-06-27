import 'package:dev_cv/components/tags_list.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class DeveloperCard extends StatelessWidget {
  final String avatarImagePath;
  final String developerName;
  final String position;
  final String location;
  final List<String> techs;

  const DeveloperCard({
    required this.avatarImagePath,
    required this.developerName,
    required this.position,
    required this.location,
    required this.techs,
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
                    backgroundImage: NetworkImage(avatarImagePath),
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
            TagsList(
              numOfTechs: 3,
              techs: techs,
            ),
          ],
        ),
      ),
    );
  }
}

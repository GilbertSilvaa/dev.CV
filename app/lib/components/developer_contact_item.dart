import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String link;

  const DeveloperContactItem({
    required this.icon,
    required this.text,
    required this.link,
    super.key,
  });

  Future<void> _launchUrl() async {
    if (link.isNotEmpty) {
      if (!await launchUrl(Uri.parse(link))) {
        throw Exception('Could not launch $link');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xffB49AFF),
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xffB49AFF),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

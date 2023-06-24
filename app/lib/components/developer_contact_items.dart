import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'developer_contact_item.dart';

class DeveloperContactItems extends StatelessWidget {
  final String location;
  final String company;
  final String github;
  final String email;
  final String linkedin;
  final String website;

  const DeveloperContactItems({
    this.location = '',
    this.company = '',
    this.github = '',
    this.email = '',
    this.linkedin = '',
    this.website = '',
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
        padding: const EdgeInsets.fromLTRB(
            30, 20, 30, 8), // bottom 8 por causa do sizedbox
        child: Column(
          children: [
            if (location.isNotEmpty) ...[
              DeveloperContactItem(
                icon: FeatherIcons.mapPin,
                text: location,
                link: '',
              ),
              const SizedBox(height: 12),
            ],
            if (company.isNotEmpty) ...[
              DeveloperContactItem(
                icon: FeatherIcons.briefcase,
                text: company,
                link: '',
              ),
              const SizedBox(height: 12),
            ],
            if (github.isNotEmpty) ...[
              DeveloperContactItem(
                icon: FeatherIcons.github,
                text: github,
                link: 'https://github.com/$github',
              ),
              const SizedBox(height: 12),
            ],
            if (email.isNotEmpty) ...[
              DeveloperContactItem(
                icon: FeatherIcons.mail,
                text: email,
                link: 'mailto:$email',
              ),
              const SizedBox(height: 12),
            ],
            if (linkedin.isNotEmpty) ...[
              DeveloperContactItem(
                icon: FeatherIcons.linkedin,
                text: linkedin,
                link: 'https://linkedin.com/in/$linkedin',
              ),
              const SizedBox(height: 12),
            ],
            if (website.isNotEmpty) ...[
              DeveloperContactItem(
                icon: FeatherIcons.globe,
                text: website,
                link: 'https://$website',
              ),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

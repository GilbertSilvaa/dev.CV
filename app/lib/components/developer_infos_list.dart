import 'package:dev_cv/components/developer_infos_container.dart';
import 'package:flutter/material.dart';

class DeveloperInfosList extends StatelessWidget {
  final String title;
  final bool hasLink;
  final int numItems;
  final String urlLink;
  final List<Map<String, String>> developerInfoItems;

  const DeveloperInfosList({
    this.urlLink = '',
    required this.numItems,
    required this.title,
    required this.hasLink,
    required this.developerInfoItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final limitedItems = developerInfoItems.take(numItems).toList();

    return DeveloperInfosContainer(
      title: title,
      hasLink: hasLink,
      urlLink: urlLink,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: limitedItems.map((item) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '•   ${item['title']}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xffB49AFF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '     ${item['subtitle']}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xffB49AFF),
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      '     ${item['txt']}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xffB49AFF),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

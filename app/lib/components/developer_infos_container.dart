import 'package:flutter/material.dart';

class DeveloperInfosContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hasLink;
  final String urlLink;

  const DeveloperInfosContainer({
    this.urlLink = '',
    required this.title,
    required this.child,
    required this.hasLink,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
              ),
              if (hasLink)
                InkWell(
                  onTap: () {
                    if (urlLink != '') {
                      Navigator.pushNamed(context, '/$urlLink');
                    }
                  },
                  child: const Text(
                    'Ver todas',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xffB49AFF),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          child
        ]),
      ),
    );
  }
}

import 'package:dev_cv/components/tag.dart';
import 'package:flutter/material.dart';

class TagsList extends StatelessWidget {
  final int numOfTechs;
  final List<String> techs;

  const TagsList({
    required this.numOfTechs,
    required this.techs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < techs.length && i < numOfTechs; i++)
          Tag(
            tagName: techs[i],
          ),
      ],
    );
  }
}

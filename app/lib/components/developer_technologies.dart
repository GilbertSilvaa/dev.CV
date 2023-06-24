import 'package:dev_cv/components/developer_infos_container.dart';
import 'package:dev_cv/components/tags_list.dart';
import 'package:flutter/material.dart';

class DeveloperTechnologies extends StatelessWidget {
  final bool hasLink;
  final List<String> techs;
  final int numOfTechs;

  const DeveloperTechnologies({
    required this.hasLink,
    required this.techs,
    required this.numOfTechs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DeveloperInfosContainer(
      title: 'Tecnologias',
      hasLink: hasLink,
      urlLink: 'techs',
      child: TagsList(
        numOfTechs: numOfTechs,
        techs: techs,
      ),
    );
  }
}

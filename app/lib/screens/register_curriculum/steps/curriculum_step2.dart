import 'package:flutter/material.dart';

class CurriculumStep2 extends StatefulWidget {
  const CurriculumStep2({super.key});

  @override
  State<CurriculumStep2> createState() => _CurriculumStep2State();
}

class _CurriculumStep2State extends State<CurriculumStep2> {
  final List<String> tags = [];
  TextEditingController textEditingController = TextEditingController();

  void addTag() {
    String tag = textEditingController.text.trim();
    if (tag.isNotEmpty) {
      setState(() {
        tags.add(tag);
        textEditingController.clear();
      });
    }
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quais tecnologias você conhece?',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textEditingController,
              onSubmitted: (value) => addTag(),
              decoration: const InputDecoration(
                hintText: 'Cadastrar nova tecnologia',
                hintStyle: TextStyle(color: Color(0xffa5a1c8)),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff7591A8)),
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              cursorColor: Colors.white,
              cursorWidth: 2.0,
            ),
            const SizedBox(
              height: 25,
            ),
            if (tags.isNotEmpty)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: const Color(0xFF2C2A42),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 9),
                            spreadRadius: -4,
                            blurRadius: 13,
                            color: Color.fromRGBO(0, 15, 5, 0.15),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: tags
                            .map(
                              (tag) => Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffB49AFF),
                                  borderRadius: BorderRadius.circular(36),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        tag.toUpperCase(),
                                        style: const TextStyle(
                                          color: Color(0xff22212C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff967BE4),
                                      ),
                                      child: GestureDetector(
                                        onTap: () => removeTag(tag),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
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

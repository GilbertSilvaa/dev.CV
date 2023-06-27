import 'package:dev_cv/components/developer_card.dart';
import 'package:dev_cv/models/curriculum_model.dart';
import 'package:dev_cv/screens/home/curriculum_screen.dart';
import 'package:dev_cv/services/api_service.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final _searchController = TextEditingController();

  Future<List<CurriculumModel>?> searchCurriculums() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenAccess = prefs.getString('access-token');

    var response = await ApiService.post(url: '/curriculum/get', headers: {
      'Content-Type': 'application/json',
      'x-access-token': tokenAccess ?? ''
    }, body: {
      'name': _searchController.text
    });

    if (response != null) {
      List<CurriculumModel> curriculuns = response
          .map<CurriculumModel>((c) => CurriculumModel.fromMap(c))
          .toList();
      return curriculuns;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lista de Currículos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        TextField(
          decoration: const InputDecoration(
            hintText: 'Buscar por desenvolvedor',
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
          onChanged: (value) => setState(() {}),
          controller: _searchController,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: FutureBuilder(
            future: searchCurriculums(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 60,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                if (snapshot.hasData) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      ...snapshot.data!.map((c) {
                        return Column(
                          children: [
                            DeveloperCard(
                              avatarImagePath: c.pictureInBase64,
                              developerName: c.name,
                              position: c.job,
                              location: c.location,
                              techs:
                                  c.technologies!.map((t) => t.name).toList(),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      }),
                    ],
                  );
                } else {
                  return const Text('Nenhum curriculo encontrado');
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

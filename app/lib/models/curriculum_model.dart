// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CurriculumModel {
  String id;
  String idUser;
  String name;
  String job;
  String pictureInBase64;
  String location;
  String? company;
  String? github;
  String? email;
  String? linkedin;
  String? site;
  List<Technologies>? technologies;
  CurriculumModel({
    required this.id,
    required this.idUser,
    required this.name,
    required this.job,
    required this.pictureInBase64,
    required this.location,
    this.company,
    this.github,
    this.email,
    this.linkedin,
    this.site,
    this.technologies,
  });

  CurriculumModel copyWith({
    String? id,
    String? idUser,
    String? name,
    String? job,
    String? pictureInBase64,
    String? location,
    String? company,
    String? github,
    String? email,
    String? linkedin,
    String? site,
    List<Technologies>? technologies,
  }) {
    return CurriculumModel(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      name: name ?? this.name,
      job: job ?? this.job,
      pictureInBase64: pictureInBase64 ?? this.pictureInBase64,
      location: location ?? this.location,
      company: company ?? this.company,
      github: github ?? this.github,
      email: email ?? this.email,
      linkedin: linkedin ?? this.linkedin,
      site: site ?? this.site,
      technologies: technologies ?? this.technologies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'idUser': idUser,
      'name': name,
      'job': job,
      'pictureInBase64': pictureInBase64,
      'location': location,
      'company': company,
      'github': github,
      'email': email,
      'linkedin': linkedin,
      'site': site,
      'technologies': technologies?.map((x) => x.toMap()).toList(),
    };
  }

  factory CurriculumModel.fromMap(Map<String, dynamic> map) {
    return CurriculumModel(
      id: map['_id'] as String,
      idUser: map['idUser'] as String,
      name: map['name'] as String,
      job: map['job'] as String,
      pictureInBase64: map['pictureInBase64'] as String,
      location: map['location'] as String,
      company: map['company'] != null ? map['company'] as String : null,
      github: map['github'] != null ? map['github'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      linkedin: map['linkedin'] != null ? map['linkedin'] as String : null,
      site: map['site'] != null ? map['site'] as String : null,
      technologies: map['technologies'] != null
          ? List<Technologies>.from(
              (map['technologies'] as List<dynamic>).map<Technologies?>(
                (x) => Technologies.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurriculumModel.fromJson(String source) =>
      CurriculumModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurriculumModel(id: $id, idUser: $idUser, name: $name, job: $job, pictureInBase64: $pictureInBase64, location: $location, company: $company, github: $github, email: $email, linkedin: $linkedin, site: $site, technologies: $technologies)';
  }

  @override
  bool operator ==(covariant CurriculumModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.idUser == idUser &&
        other.name == name &&
        other.job == job &&
        other.pictureInBase64 == pictureInBase64 &&
        other.location == location &&
        other.company == company &&
        other.github == github &&
        other.email == email &&
        other.linkedin == linkedin &&
        other.site == site &&
        listEquals(other.technologies, technologies);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idUser.hashCode ^
        name.hashCode ^
        job.hashCode ^
        pictureInBase64.hashCode ^
        location.hashCode ^
        company.hashCode ^
        github.hashCode ^
        email.hashCode ^
        linkedin.hashCode ^
        site.hashCode ^
        technologies.hashCode;
  }
}

class Technologies {
  String id;
  String name;
  String icon;
  Technologies({
    required this.id,
    required this.name,
    required this.icon,
  });

  Technologies copyWith({
    String? id,
    String? name,
    String? icon,
  }) {
    return Technologies(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'icon': icon,
    };
  }

  factory Technologies.fromMap(Map<String, dynamic> map) {
    return Technologies(
      id: map['_id'] as String,
      name: map['name'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Technologies.fromJson(String source) =>
      Technologies.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Technologies(id: $id, name: $name, icon: $icon)';

  @override
  bool operator ==(covariant Technologies other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.icon == icon;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ icon.hashCode;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MusicServiceModel {
  String? id;
  String title;
  String description;
  String iconName;
  Timestamp createdAt;
  MusicServiceModel({
    this.id,
    required this.title,
    required this.description,
    required this.iconName,
    required this.createdAt,
  });

  MusicServiceModel copyWith({
    String? id,
    String? title,
    String? description,
    String? iconName,
    Timestamp? createdAt,
  }) {
    return MusicServiceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      iconName: iconName ?? this.iconName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'iconName': iconName,
      'createdAt': createdAt,
    };
  }

  factory MusicServiceModel.fromMap(Map<String, dynamic> map) {
    return MusicServiceModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      description: map['description'] as String,
      iconName: map['iconName'] as String,
      createdAt: map['createdAt'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicServiceModel.fromJson(String source) =>
      MusicServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:music_service_module/features/create_music_service/model/music_service_model.dart';
import 'package:music_service_module/features/create_music_service/repository/music_service_repository.dart';
import 'package:music_service_module/general/failures/main_failures.dart';

class MusicServiceViewModel with ChangeNotifier {
  final MusicServiceRepository musicServiceRepository;

  MusicServiceViewModel({required this.musicServiceRepository});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final iconNameController = TextEditingController();

  List<MusicServiceModel> musicList = [];

  Future<void> addMusicService() async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final iconName = iconNameController.text.trim();

    final result = await musicServiceRepository.addMusicService(
        musicServiceModel: MusicServiceModel(
            title: title,
            description: description,
            iconName: iconName,
            createdAt: Timestamp.now()));

    result.fold((failure) {
      MainFailure.serverFailure(errorMessage: failure.errorMessage);
    }, (success) {
      log('add music succesfully');
    });
  }

  Future<void> getMusicService() async {
    final result = await musicServiceRepository.getMusicService();

    result.fold((failure) {
      log(failure.errorMessage);
    }, (success) {
      musicList.addAll(success);
    });
    notifyListeners();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_service_module/features/create_music_service/model/music_service_model.dart';
import 'package:music_service_module/features/create_music_service/repository/music_service_repository.dart';
import 'package:music_service_module/general/failures/main_failures.dart';
import 'package:music_service_module/general/utils/firebase_collections.dart';
@LazySingleton(as: MusicServiceRepository)
class MusicServiceRepositoryImpl implements MusicServiceRepository {
  final FirebaseFirestore firebaseFirestore;
 
  MusicServiceRepositoryImpl({required this.firebaseFirestore});
  @override
  Future<Either<MainFailure, MusicServiceModel>> addMusicService(
      {required MusicServiceModel musicServiceModel}) async {
    try {
      final musicServiceRef =
          firebaseFirestore.collection(FirebaseCollections.musicSrvice);

      final id = musicServiceRef.doc().id;

      final musicService = musicServiceModel.copyWith(id: id);

      await musicServiceRef.doc(id).set(musicService.toMap());

      return right(musicService);
    } catch (e) {
      return left(MainFailure.serverFailure(errorMessage: e.toString()));
    }
  }
}

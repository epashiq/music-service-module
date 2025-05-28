import 'package:dartz/dartz.dart';
import 'package:music_service_module/features/create_music_service/model/music_service_model.dart';
import 'package:music_service_module/general/failures/main_failures.dart';

abstract class MusicServiceRepository {
  Future<Either<MainFailure, MusicServiceModel>> addMusicService({required MusicServiceModel musicServiceModel}) async {
    throw UnimplementedError('addMusicService() not added');
  }
}

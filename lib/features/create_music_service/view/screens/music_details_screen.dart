import 'package:flutter/material.dart';
import 'package:music_service_module/features/create_music_service/model/music_service_model.dart';

class MusicDetailsScreen extends StatefulWidget {
  final MusicServiceModel musicServiceModel;
  const MusicDetailsScreen({super.key, required this.musicServiceModel});

  @override
  State<MusicDetailsScreen> createState() => _MusicDetailsScreenState();
}

class _MusicDetailsScreenState extends State<MusicDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.musicServiceModel.title),
      ),
      body: Column(
        children: [
          Text('You Tapped on : ${widget.musicServiceModel.description}')
        ],
      ),
    );
  }
}
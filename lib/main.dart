import 'package:flutter/material.dart';
import 'package:music_service_module/features/create_music_service/repository/music_service_repository.dart';
import 'package:music_service_module/features/create_music_service/view/screens/music_screen.dart';
import 'package:music_service_module/features/create_music_service/view_model/music_service_view_model.dart';
import 'package:music_service_module/general/di/injection.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => MusicServiceViewModel(
                musicServiceRepository: sl<MusicServiceRepository>()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MusicScreen(),
      ),
    );
  }
}

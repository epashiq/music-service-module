import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_service_module/features/create_music_service/view/screens/music_details_screen.dart';
import 'package:music_service_module/features/create_music_service/view/widgets/add_music_dialog_widget.dart';
import 'package:music_service_module/features/create_music_service/view/widgets/bottom_navigation_item_widget.dart';
import 'package:music_service_module/features/create_music_service/view/widgets/service_card_widget.dart';
import 'package:music_service_module/features/create_music_service/view_model/music_service_view_model.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  void initState() {
    super.initState();
    final musicServiceViewModel =
        Provider.of<MusicServiceViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      musicServiceViewModel.getMusicService();
    });
  }

  @override
  Widget build(BuildContext context) {
    final musicServiceViewModel = Provider.of<MusicServiceViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0XFFA90140),
                    Color(0xFF550120),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Search bar
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0XFF2F2F39),
                                      hintText: 'Search "Punjabi Lyrics" ',
                                      hintStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0XFF61616B)),
                                      suffixIcon:
                                          Image.asset('assets/icons/mike.png'),
                                      prefixIcon: Image.asset(
                                          'assets/icons/search.png'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: const Color(0XFFEADDFF),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Image.asset('assets/icons/Avatar.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Claim your',
                              style: GoogleFonts.syne(
                                textStyle: const TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 13),
                            Text(
                              'Free Demo',
                              style: GoogleFonts.lobster(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'for custom Music Production',
                              style: GoogleFonts.syne(
                                textStyle: const TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                'Book Now',
                                style: GoogleFonts.syne(
                                  textStyle: const TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Services section
            Expanded(
              child: Container(
                color: const Color(0xFF18171c),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hire hand-picked Pros for popular music services',
                          style: GoogleFonts.syne(
                            color: const Color(0XFFFFFFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: Consumer<MusicServiceViewModel>(
                        builder: (context, musiPro, child) {
                          if (musiPro.musicList.isEmpty) {
                            return const Text('no music data available');
                          }
                          return ListView.builder(
                            itemCount: musiPro.musicList.length,
                            itemBuilder: (context, index) {
                              final music = musiPro.musicList[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MusicDetailsScreen(
                                                musicServiceModel: music),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ServiceCardWidget(
                                      icon: music.iconName,
                                      title: music.title,
                                      descreption: music.description,
                                      imagePath:
                                          'assets/icons/music-background.jpg'),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom navigation
            Container(
              height: 83,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                border: Border(
                  top: BorderSide(
                      color: Colors.white.withOpacity(0.1), width: 0.5),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationItemWidget(
                      iconPath: 'assets/icons/home.png',
                      label: 'Home',
                      isActive: true),
                  BottomNavigationItemWidget(
                      iconPath: 'assets/icons/news.png', label: 'News'),
                  BottomNavigationItemWidget(
                      iconPath: 'assets/icons/track-box.png',
                      label: 'Track Box'),
                  BottomNavigationItemWidget(
                      iconPath: 'assets/icons/projects.png', label: 'Projects'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddMusicDialogWidget(
                  titleController: musicServiceViewModel.titleController,
                  descriptionController:
                      musicServiceViewModel.descriptionController,
                  iconNameController: musicServiceViewModel.iconNameController,
                  onAdd: () {
                    musicServiceViewModel.addMusicService();
                  });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

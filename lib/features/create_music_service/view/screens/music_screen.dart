import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_service_module/features/create_music_service/view/widgets/service_card_widget.dart';
import 'package:music_service_module/features/create_music_service/view_model/bottom_navigation_item_widget.dart';
import 'package:music_service_module/features/create_music_service/view_model/music_service_view_model.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    final musicServiceViewModel = Provider.of<MusicServiceViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            // Top section with gradient background
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
                                      suffixIcon: const Icon(Icons.mic,
                                          color: Color(0XFFFFFFFF), size: 20),
                                      prefixIcon: const Icon(Icons.search,
                                          color: Color(0XFFFFFFFF), size: 20),
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
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: const [
                          ServiceCardWidget(
                            icon: Icons.equalizer,
                            iconColor: Color(0xFFFF6B6B),
                            title: 'Music Production',
                            subtitle: 'Custom instrumentals & film scoring',
                            imagePath: 'assets/icons/music-background.jpg',
                          ),
                          ServiceCardWidget(
                            icon: Icons.tune,
                            iconColor: Color(0xFF4ECDC4),
                            title: 'Mixing & Mastering',
                            subtitle: 'Make your tracks Radio-ready',
                            imagePath: 'assets/icons/music-background.jpg',
                          ),
                          ServiceCardWidget(
                            icon: Icons.edit,
                            iconColor: Color(0xFFFFE66D),
                            title: 'Lyrics Writing',
                            subtitle: 'Turn feelings into lyrics',
                            imagePath: 'assets/icons/music-background.jpg',
                          ),
                          ServiceCardWidget(
                            icon: Icons.mic,
                            iconColor: Color(0xFFB19CD9),
                            title: 'Vocals',
                            subtitle: 'Vocals that bring your lyrics to life',
                            imagePath: 'assets/icons/music-background.jpg',
                          ),
                        ],
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
                      iconPath: 'assets/icons/news.png', label: 'Genres'),
                  BottomNavigationItemWidget(
                      iconPath: 'assets/icons/track-box.png',
                      label: 'Top Songs'),
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
              return AlertDialog(
                title: const Text('add music'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: musicServiceViewModel.titleController,
                      decoration: InputDecoration(
                          hintText: 'title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    TextField(
                      controller: musicServiceViewModel.descriptionController,
                      decoration: InputDecoration(
                          hintText: 'descreption',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    TextField(
                      controller: musicServiceViewModel.iconNameController,
                      decoration: InputDecoration(
                        hintText: 'image path',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.paste),
                          onPressed: () async {
                            final data = await Clipboard.getData('text/plain');
                            if (data?.text != null) {
                              musicServiceViewModel.iconNameController.text =
                                  data!.text!;
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        musicServiceViewModel.addMusicService();
                        Navigator.pop(context);
                      },
                      child: const Text('Add')),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

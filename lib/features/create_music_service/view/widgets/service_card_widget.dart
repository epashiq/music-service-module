import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCardWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String descreption;
  final String imagePath;

  const ServiceCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.descreption,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(icon),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.syne(
                          color: const Color(0XFFFFFFFF),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        descreption,
                        style: GoogleFonts.syne(
                          color: const Color(0XFFFFFFFF),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Icon(Icons.chevron_right, color: Colors.white54),
                Image.asset('assets/icons/arrow-forward.png')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

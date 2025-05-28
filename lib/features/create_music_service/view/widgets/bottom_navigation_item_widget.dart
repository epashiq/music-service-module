import 'package:flutter/material.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;

  const BottomNavigationItemWidget({
    super.key,
    required this.iconPath,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

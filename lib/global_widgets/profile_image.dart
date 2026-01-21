import 'package:flutter/material.dart';
import '../core/utils/size_utils.dart';

class ProfileImage extends StatelessWidget {
  final String imagePath;
  final double size;
  final VoidCallback? onTap;

  const ProfileImage({
    super.key,
    required this.imagePath,
    this.size = 60,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.w),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PersistentHeader extends StatelessWidget {
  final Widget? child;
  final double height;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  const PersistentHeader({
    super.key,
    this.child,
    this.height = 140,
    this.backgroundColor = const Color(0xFF00204A),
    this.padding,
  });

  factory PersistentHeader.welcome({
    required String title,
    required String subtitle,
  }) {
    return PersistentHeader(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Welcome Text
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}

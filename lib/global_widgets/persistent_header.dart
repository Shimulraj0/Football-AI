import 'package:flutter/material.dart';
import '../../core/values/app_padding.dart';

class PersistentHeader extends StatelessWidget {
  final Widget? child;
  final double height;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  const PersistentHeader({
    super.key,
    this.child,
    this.height = 160,
    this.backgroundColor = const Color(0xFF00204A),
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? AppPadding.headerPadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(bottom: false, child: child ?? const SizedBox.shrink()),
    );
  }
}

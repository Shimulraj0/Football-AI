import 'package:flutter/material.dart';

class RoleModel {
  final String id;
  final String title;
  final String assetPath;
  final String? route;
  final IconData? icon;
  final bool isFeatured;

  RoleModel({
    required this.id,
    required this.title,
    required this.assetPath,
    this.route,
    this.icon,
    this.isFeatured = false,
  });
}

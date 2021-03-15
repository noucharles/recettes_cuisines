import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  // On mets const ici pparcequ'il y'a const const sur dummy_data.dart
  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange
  });

}
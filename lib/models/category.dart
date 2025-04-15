import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final IconData icon;

  Category({required this.id, required this.name, required this.icon});

  static List<Category> categories = [
    Category(id: '1', name: 'Makanan Utama', icon: Icons.restaurant),
    Category(id: '2', name: 'Makanan Penutup', icon: Icons.cake),
    Category(id: '3', name: 'Minuman', icon: Icons.local_drink),
    Category(id: '4', name: 'Camilan', icon: Icons.fastfood),
  ];
}

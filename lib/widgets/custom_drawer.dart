import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Rumah Makan Khas Bengkulu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Otentik & Lezat',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Menu items
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text('Menu'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/menu');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Pesanan'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/order');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile');
            },
          ),

          Divider(),

          // Additional pages
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Tentang Kami'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/page_one');
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Galeri'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/page_two');
            },
          ),

          Divider(),

          // Settings and support
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Pengaturan'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Bantuan'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to help page
            },
          ),
        ],
      ),
    );
  }
}

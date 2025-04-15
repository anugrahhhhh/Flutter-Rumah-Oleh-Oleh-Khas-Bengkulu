import 'package:flutter/material.dart';
import '../buttons/flat_button.dart';
import '../buttons/icon_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Sample user data
  final Map<String, dynamic> userData = {
    'name': 'Anugrah Putra Al Fatih',
    'email': 'anugrahputra270@gmail.com',
    'phone': '087815386696',
    'address': 'Jl. Supratman No. 10, Bengkulu',
    'profileImage': 'assets/icons/profile.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
        actions: [
          CustomIconButton(
            icon: Icons.edit,
            onPressed: () {
              // Edit profile logic
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 70,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
              child: ClipOval(
                child: Image.asset(
                  userData['profileImage'],
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // User name
            Text(
              userData['name'],
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              userData['email'],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 32),

            // Profile sections
            _buildSectionCard(
              context,
              title: 'Informasi Kontak',
              content: Column(
                children: [
                  _buildInfoRow(Icons.phone, 'No. Telepon', userData['phone']),
                  Divider(height: 24),
                  _buildInfoRow(Icons.email, 'Email', userData['email']),
                  Divider(height: 24),
                  _buildInfoRow(
                    Icons.location_on,
                    'Alamat',
                    userData['address'],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            _buildSectionCard(
              context,
              title: 'Histori Pesanan',
              content: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Text('1'),
                    ),
                    title: Text('Pesanan #12345'),
                    subtitle: Text('2 April 2025 • Rp 85.000'),
                    trailing: Chip(
                      label: Text('Selesai'),
                      backgroundColor: Colors.green[100],
                      labelStyle: TextStyle(color: Colors.green[800]),
                    ),
                  ),
                  Divider(height: 0),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Text('2'),
                    ),
                    title: Text('Pesanan #12346'),
                    subtitle: Text('5 April 2025 • Rp 120.000'),
                    trailing: Chip(
                      label: Text('Diantar'),
                      backgroundColor: Colors.blue[100],
                      labelStyle: TextStyle(color: Colors.blue[800]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            _buildSectionCard(
              context,
              title: 'Pengaturan',
              content: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifikasi'),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  Divider(height: 0),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Bahasa'),
                    trailing: Text('Indonesia'),
                    onTap: () {},
                  ),
                  Divider(height: 0),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Bantuan'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            CustomFlatButton(
              text: 'Keluar',
              onPressed: () {
                // Implement logout
              },
              textColor: Colors.red,
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required Widget content,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.displaySmall),
            SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}

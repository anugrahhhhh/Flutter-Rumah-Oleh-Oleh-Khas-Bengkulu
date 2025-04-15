import 'package:flutter/material.dart';
import '../models/food.dart';
import '../widgets/food_card.dart';
import '../buttons/raised_button.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<Food> featuredFoods = Food.getPopularFoods();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tentang Kami')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pendap.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rumah Makan Khas Bengkulu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Melestarikan Cita Rasa Tradisional Bengkulu',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // About us
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentang Kami',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Rumah Makan Khas Bengkulu adalah restoran yang berdedikasi untuk menyajikan makanan tradisional Bengkulu yang otentik sejak tahun 2010.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Kami bermula dari warung kecil di sudut kota Bengkulu dan kini telah berkembang menjadi restoran yang dikenal akan kualitas dan keaslian citarasa kuliner Bengkulu.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Bahan-bahan yang kami gunakan dipilih langsung dari pasar lokal dan produsen setempat untuk mendukung ekonomi lokal dan memastikan kesegaran setiap hidangan.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  // Divider
                  Divider(height: 48),

                  // Signature dish
                  Text(
                    'Hidangan Unggulan',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredFoods.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: featuredFoods[index],
                              );
                            },
                            child: FoodCard(food: featuredFoods[index]),
                          ),
                        );
                      },
                    ),
                  ),

                  // Divider
                  Divider(height: 48),

                  // Location
                  Text(
                    'Lokasi',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map, size: 48, color: Colors.grey[600]),
                          SizedBox(height: 8),
                          Text('Peta Lokasi'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Alamat:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Jl. Supratman No. 45, Kota Bengkulu'),
                  SizedBox(height: 8),
                  Text(
                    'Jam Buka:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Senin - Minggu: 10:00 - 22:00 WIB'),

                  // Divider
                  Divider(height: 48),

                  // Newsletter
                  Text(
                    'Berlangganan Info & Promo',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Masukkan email Anda',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomRaisedButton(
                    text: 'Berlangganan',
                    onPressed: () {
                      // Newsletter subscription logic
                      if (_emailController.text.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terima kasih telah berlangganan!'),
                          ),
                        );
                        _emailController.clear();
                      }
                    },
                  ),

                  // Go to next page button
                  SizedBox(height: 32),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/page_two');
                      },
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Lihat Galeri Makanan'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

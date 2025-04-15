import 'package:flutter/material.dart';
import '../models/food.dart';
import '../buttons/floating_action_button.dart';
import '../buttons/icon_button.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final List<String> galleryImages = [
    'assets/images/pendap.jpeg',
    'assets/images/bay_tat.jpg',
    'assets/images/lemea.jpeg',
    'assets/images/rebung_asam.jpeg',
    'assets/images/kue_tat.jpeg',
    // Duplicate images to fill the gallery
    'assets/images/pendap.jpeg',
    'assets/images/bay_tat.jpg',
    'assets/images/lemea.jpeg',
  ];

  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Budi Santoso',
      'rating': 5,
      'comment':
          'Pendap di sini sangat enak dan otentik. Rasanya persis seperti buatan nenekku dulu.',
      'date': '2 April 2025',
    },
    {
      'name': 'Siti Nuraini',
      'rating': 4,
      'comment': 'Lemea-nya lezat sekali! Pelayanan juga ramah dan cepat.',
      'date': '28 Maret 2025',
    },
    {
      'name': 'Ahmad Wijaya',
      'rating': 5,
      'comment':
          'Kue Tat di sini terbaik di Bengkulu. Tidak terlalu manis dan teksturnya sempurna.',
      'date': '15 Maret 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galeri & Testimoni')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gallery title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Galeri Makanan',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),

            // Gallery grid
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: galleryImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Show full screen image
                    _showFullScreenImage(context, index);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(galleryImages[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),

            // Testimonials
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Text(
                    'Testimoni Pelanggan',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 16),

                  // Testimonial cards
                  ...testimonials.map(
                    (testimonial) => _buildTestimonialCard(testimonial),
                  ),

                  // Add review button
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showAddReviewDialog(context);
                      },
                      icon: Icon(Icons.rate_review),
                      label: Text('Tambahkan Ulasan'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),

                  // Back to page one button
                  SizedBox(height: 32),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      label: Text('Kembali ke Halaman Sebelumnya'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icons.home,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
      ),
    );
  }

  Widget _buildTestimonialCard(Map<String, dynamic> testimonial) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  testimonial['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  testimonial['date'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < testimonial['rating']
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(testimonial['comment']),
          ],
        ),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, int index) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            insetPadding: EdgeInsets.zero,
            child: Stack(
              children: [
                // Image
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      galleryImages[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Close button
                Positioned(
                  top: 16,
                  right: 16,
                  child: CustomIconButton(
                    icon: Icons.close,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.black54,
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _showAddReviewDialog(BuildContext context) {
    int _rating = 5;
    final _reviewController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text('Tambahkan Ulasan'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => IconButton(
                          icon: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Review text
                    TextField(
                      controller: _reviewController,
                      decoration: InputDecoration(
                        labelText: 'Ulasan',
                        hintText: 'Bagikan pengalaman Anda',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Batal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_reviewController.text.isNotEmpty) {
                        // Add review logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terima kasih atas ulasan Anda!'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Kirim'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              );
            },
          ),
    );
  }
}

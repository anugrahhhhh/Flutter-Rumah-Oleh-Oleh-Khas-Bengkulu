class Food {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  final List<String> ingredients;
  final bool isPopular;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.ingredients,
    this.isPopular = false,
  });

  static List<Food> sampleFoods = [
    Food(
      id: '1',
      name: 'Pendap',
      description:
          'Makanan tradisional khas Bengkulu yang terbuat dari ikan yang dicampur dengan bumbu khusus dan dibungkus daun talas kemudian dipanggang.',
      price: 25000,
      image: 'assets/images/pendap.jpeg',
      category: 'Makanan Utama',
      ingredients: [
        'Ikan laut',
        'Cabai',
        'Kelapa parut',
        'Daun talas',
        'Bumbu rempah',
      ],
      isPopular: true,
    ),
    Food(
      id: '2',
      name: 'Bay Tat',
      description:
          'Hidangan khas Bengkulu berupa ikan yang dimasak dengan bumbu pedas dan asam dengan tambahan terung.',
      price: 30000,
      image: 'assets/images/bay_tat.jpg',
      category: 'Makanan Utama',
      ingredients: ['Ikan', 'Terung', 'Cabai', 'Asam', 'Bumbu rempah'],
    ),
    Food(
      id: '3',
      name: 'Lemea',
      description:
          'Makanan fermentasi berbahan dasar rebung bambu yang dimasak dengan berbagai bumbu pedas khas Bengkulu.',
      price: 20000,
      image: 'assets/images/lemea.jpeg',
      category: 'Makanan Utama',
      ingredients: ['Rebung fermentasi', 'Cabai', 'Ikan', 'Bumbu rempah'],
      isPopular: true,
    ),
    Food(
      id: '4',
      name: 'Rebung Asam',
      description:
          'Masakan dengan bahan utama rebung bambu yang dimasak dengan bumbu asam dan rempah khas Bengkulu.',
      price: 18000,
      image: 'assets/images/rebung_asam.jpeg',
      category: 'Makanan Utama',
      ingredients: ['Rebung', 'Asam', 'Cabai', 'Bumbu rempah'],
    ),
    Food(
      id: '5',
      name: 'Kue Tat',
      description:
          'Kue tradisional khas Bengkulu berbentuk persegi dengan lapisan adonan yang tipis dan selai nanas di atasnya.',
      price: 15000,
      image: 'assets/images/kue_tat.jpeg',
      category: 'Makanan Penutup',
      ingredients: ['Tepung', 'Telur', 'Mentega', 'Selai nanas'],
      isPopular: true,
    ),
  ];

  // Method untuk mendapatkan makanan berdasarkan kategori
  static List<Food> getFoodsByCategory(String category) {
    return sampleFoods.where((food) => food.category == category).toList();
  }

  // Method untuk mendapatkan makanan populer
  static List<Food> getPopularFoods() {
    return sampleFoods.where((food) => food.isPopular).toList();
  }
}

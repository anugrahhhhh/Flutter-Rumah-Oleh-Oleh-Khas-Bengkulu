import 'package:flutter/material.dart';
import '../models/food.dart';
import '../models/order.dart';
import '../widgets/counter_widget.dart';
import '../buttons/raised_button.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Food food = ModalRoute.of(context)!.settings.arguments as Food;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(food.name),
              background: Hero(
                tag: 'food-${food.id}',
                child: Image.asset(food.image, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          food.name,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          'Rp ${food.price.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Category chip
                    Chip(
                      label: Text(food.category),
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.3),
                    ),
                    SizedBox(height: 16),

                    // Description
                    Text(
                      'Deskripsi',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: 8),
                    Text(
                      food.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 24),

                    // Ingredients
                    Text(
                      'Bahan-bahan',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          food.ingredients.map((ingredient) {
                            return Chip(
                              label: Text(ingredient),
                              backgroundColor: Colors.grey[200],
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 24),

                    // Quantity
                    Text(
                      'Jumlah',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: 8),
                    CounterWidget(
                      count: quantity,
                      onIncrement: _incrementQuantity,
                      onDecrement: _decrementQuantity,
                    ),
                    SizedBox(height: 32),

                    // Add to cart button
                    CustomRaisedButton(
                      text:
                          'Tambahkan ke Keranjang - Rp ${(food.price * quantity).toStringAsFixed(0)}',
                      onPressed: () {
                        // Add to cart logic
                        final OrderItem newItem = OrderItem(
                          food: food,
                          quantity: quantity,
                        );

                        // Show success snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${food.name} telah ditambahkan ke keranjang',
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // Navigate back or to cart
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

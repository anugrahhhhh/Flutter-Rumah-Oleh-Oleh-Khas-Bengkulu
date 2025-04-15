import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/food.dart';
import '../widgets/counter_widget.dart';
import '../buttons/flat_button.dart';
import '../buttons/raised_button.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<OrderItem> cartItems = [
    OrderItem(food: Food.sampleFoods[0], quantity: 2),
    OrderItem(food: Food.sampleFoods[2], quantity: 1),
  ];

  void _updateQuantity(OrderItem item, int newQuantity) {
    if (newQuantity <= 0) {
      setState(() {
        cartItems.remove(item);
      });
    } else {
      setState(() {
        item.quantity = newQuantity;
      });
    }
  }

  double get totalPrice {
    return cartItems.fold(
      0,
      (sum, item) => sum + item.food.price * item.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keranjang Belanja')),
      body:
          cartItems.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 100,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Keranjang Anda kosong',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tambahkan beberapa makanan lezat',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 24),
                    CustomFlatButton(
                      text: 'Lihat Menu',
                      onPressed: () {
                        Navigator.pushNamed(context, '/menu');
                      },
                    ),
                  ],
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Card(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                // Food image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item.food.image,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16),
                                // Food details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.food.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Rp ${item.food.price.toStringAsFixed(0)}',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      // Quantity controls
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              _updateQuantity(
                                                item,
                                                item.quantity - 1,
                                              );
                                            },
                                            iconSize: 20,
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            '${item.quantity}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(width: 8),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              _updateQuantity(
                                                item,
                                                item.quantity + 1,
                                              );
                                            },
                                            iconSize: 20,
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Price
                                Text(
                                  'Rp ${(item.food.price * item.quantity).toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Order summary
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ringkasan Pesanan',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal'),
                            Text('Rp ${totalPrice.toStringAsFixed(0)}'),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Ongkos Kirim'), Text('Rp 15,000')],
                        ),
                        Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rp ${(totalPrice + 15000).toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        CustomRaisedButton(
                          text: 'Lanjutkan ke Pembayaran',
                          onPressed: () {
                            // Implement checkout
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Pesanan berhasil dibuat'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}

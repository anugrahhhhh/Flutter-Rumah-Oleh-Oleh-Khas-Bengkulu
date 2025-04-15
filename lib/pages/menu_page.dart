import 'package:flutter/material.dart';
import '../models/food.dart';
import '../models/category.dart';
import '../widgets/food_card.dart';
import '../widgets/tab_bar.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Food> allFoods = Food.sampleFoods;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: Category.categories.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          tabs:
              Category.categories.map((category) {
                return Tab(text: category.name, icon: Icon(category.icon));
              }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:
            Category.categories.map((category) {
              List<Food> categoryFoods = Food.getFoodsByCategory(category.name);

              return categoryFoods.isEmpty
                  ? Center(child: Text('Tidak ada menu di kategori ini'))
                  : GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: categoryFoods.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: categoryFoods[index],
                          );
                        },
                        child: FoodCard(
                          food: categoryFoods[index],
                          isGrid: true,
                        ),
                      );
                    },
                  );
            }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/order');
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

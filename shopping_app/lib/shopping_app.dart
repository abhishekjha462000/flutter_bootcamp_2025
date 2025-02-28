import 'package:flutter/material.dart';
import 'package:shopping_app/product_list.dart';
import 'package:shopping_app/shopping_cart.dart';

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        //  for persistence when we change the screen
        // our old progress does not get lost
        index: currentPage,
        children: const [ProductList(), ShoppingCart()],
      ),
      // body: currentPage == 0 ? const ProductList() : const ShoppingCart(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          // set the currentpage to value
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
        ],
      ),
    );
  }
}

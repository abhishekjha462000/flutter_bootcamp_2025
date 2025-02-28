import 'package:flutter/material.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/products.dart';
import 'package:shopping_app/product_page.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final border = const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 1),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));

  final brands = ['All', 'Nick', 'Adidas', 'Jordans'];
  String filter = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Shoe\nCollection',
                  style: Theme.of(context).textTheme.labelSmall,
                  // style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: border,
                    enabledBorder: border,
                  ),
                ),
              )
            ],
          ),

          // chips in list view builder
          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (filter != brands[index]) {
                          filter = brands[index];
                        } else {
                          filter = '';
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Chip(
                        labelStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        label: Text(
                          brands[index],
                        ),
                        backgroundColor: filter == brands[index]
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                      ),
                    ),
                  );
                }),
          ),

          // display the products
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    imageUrl: product['imageUrl'] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

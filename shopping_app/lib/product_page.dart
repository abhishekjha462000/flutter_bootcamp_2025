import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductPage extends StatefulWidget {
  final Map<String, Object?> product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int? selectedSize; // Stores the selected size

  void onPressed() {
    // do this only when a size has been selected
    final sizes = widget.product['sizes'] as List<int>;
    if (sizes.contains(selectedSize)) {
      Provider.of<CartProvider>(context, listen: false).addItem({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'size': selectedSize
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item added to the cart'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Select a size plijjjj!!!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.product['title'] as String,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                widget.product['imageUrl'] as String,
                height: 200,
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffdfd9d9),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${widget.product['price']}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Show all the sizes
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            (widget.product['sizes'] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['sizes'] as List<int>)[index];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size; // Update selected size
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Chip(
                                label: Text(
                                  size.toString(),
                                  style: TextStyle(
                                    color: selectedSize == size
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                backgroundColor: selectedSize == size
                                    ? Colors.yellow
                                    : Colors.grey[300],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: WidgetStateProperty.all(
                                const Size.fromWidth(300))),
                        onPressed: onPressed,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart, color: Colors.black),
                            SizedBox(width: 8),
                            Text(
                              'Add to cart',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

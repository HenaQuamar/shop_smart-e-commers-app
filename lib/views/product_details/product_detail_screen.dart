import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> images;

  const ProductDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.images,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedImage = 0;
  int quantity = 1;
  String selectedSize = 'M';
  Color selectedColor = Colors.green;

  final List<String> sizes = ['S', 'M', 'L', 'XL'];
  final List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.blue,
    Colors.green,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List.generate(widget.images.length, (index) {
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedImage = index),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedImage == index
                                        ? Color(0xF01A237E)
                                        : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.network(
                                  widget.images[index],
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Image.network(
                            widget.images[selectedImage],
                            fit: BoxFit.cover,
                            height: 250,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: Colors.orange.shade400, size: 18),
                            const SizedBox(width: 4),
                            Text("${widget.rating} Ratings",
                                style: const TextStyle(color: Colors.grey)),
                            const SizedBox(width: 15),
                            const Text("1.3k Reviews",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Size",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        Row(
                          children: sizes.map((size) {
                            final isSelected = selectedSize == size;
                            return GestureDetector(
                              onTap: () => setState(() => selectedSize = size),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.green
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: isSelected
                                          ? Colors.green
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(size,
                                    style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Colour",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        Row(
                          children: colors.map((color) {
                            final isSelected = selectedColor == color;
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedColor = color),
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: isSelected
                                          ? Colors.green
                                          : Colors.grey),
                                ),
                                child: isSelected
                                    ? const Icon(Icons.check,
                                        size: 16, color: Colors.white)
                                    : null,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(widget.description,
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 14)),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),


          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.white10,
                  offset: const Offset(0, 1),
                )
              ],
              color: Colors.green.shade100.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Rs. ${widget.price}",
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xF01A237E))),
                    const SizedBox(width: 8),
                    Text("Rs. 3,499",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)),

                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() => quantity--);
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(quantity.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          onPressed: () => setState(() => quantity++),
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {},
                        child: const Text("Add To Cart",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {},
                        child: const Text("Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


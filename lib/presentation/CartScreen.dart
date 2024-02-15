import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<CartModel> data;
  const CartScreen({required this.data, Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    print("Product length >>${widget.data}");
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text(widget.data[0].totalProducts.toString()),
        ),
      ),
    );  }
}

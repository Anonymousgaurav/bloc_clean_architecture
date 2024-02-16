import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class CartScreen extends StatefulWidget {
  final List<CartModel> data;
  const CartScreen({required this.data, Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(itemBuilder: (context ,index){
          return Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${widget.data[index].productModel[index].productTitle}"),
                    Text(" "),
                    Text("${widget.data[index].productModel[index].productQuantity}"),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Total Products'),
                    Text(" "),
                    Text("${widget.data[index].totalProducts}"),
                  ],
                ),
               Image.memory(base64.decode(widget.data[index].productModel[index].localThumbnail ?? ""))
              ],
            ),
          );
        },itemCount: widget.data.length,)
      ),
    );
  }


}

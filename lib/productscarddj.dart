import 'package:flutter/material.dart';
import 'package:retail/products_card.dart';

class proddj extends StatelessWidget {
  const proddj({
    super.key,
    required this.recolist,
  });

  final List<Map<String, dynamic>> recolist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: recolist.length,
      itemBuilder: (context, index) {
        final product = recolist[index];
        // final productCostPrice =
        //     double.parse(product['productCostPrice']);
        // final productDiscountPercentage =
        //     double.parse(product['productDiscountPercentage']);
        // int mrp = product['productCostPrice'] / 1 -
        //     (product['productDiscountPercentage'] / 100);

        return productcard(
            product['productImage'],
            product['productName'],
            product['productDescription'],
            product['productCostPrice'],
            product['productDiscountPercentage']);
      },
    );
  }
}

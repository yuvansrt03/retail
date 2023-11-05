import 'package:flutter/material.dart';
import 'package:retail/dealsoftheday_card.dart';

class dealsdj extends StatelessWidget {
  const dealsdj({
    super.key,
    required this.productList,
  });

  final List<Map<String, dynamic>> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        // final productCostPrice =
        //     double.parse(product['productCostPrice']);
        // final productDiscountPercentage =
        //     double.parse(product['productDiscountPercentage']);
        // int mrp = product['productCostPrice'] / 1 -
        //     (product['productDiscountPercentage'] / 100);

        return dealsoftheday_card(
            product['productImage'],
            product['productName'],
            product['productDescription'],
            product['productCostPrice'],
            product['productDiscountPercentage']);
      },
    );
  }
}

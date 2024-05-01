import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/food_item.dart';

import '../cardapio.dart';

class FoodMenu extends StatelessWidget {
  final List foods = comidas;

  const FoodMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Cardápio",
                style: TextStyle(fontFamily: 'Caveat', fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return FoodItem(
                    itemTitle: foods[index]['name'],
                    itemPrice: foods[index]['price'],
                    imageURI: foods[index]['image']);
              },childCount: foods.length
            ),
          )
        ],
      ),
    );
  }
}

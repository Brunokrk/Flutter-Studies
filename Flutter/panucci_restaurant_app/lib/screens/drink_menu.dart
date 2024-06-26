import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/drink_item.dart';

import '../cardapio.dart';

class DrinkMenu extends StatelessWidget {
  final List items = drinks;

  const DrinkMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Bebidas",
                style: TextStyle(fontSize: 32, fontFamily: "Caveat"),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DrinkItem(
                    imageURI: items[index]["image"],
                    itemTitle: items[index]["name"],
                    itemPrice: items[index]["price"]);
              },
              childCount: items.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3:2,
                crossAxisSpacing: 8, mainAxisSpacing: 8,
                childAspectRatio: MediaQuery.of(context).orientation == Orientation.landscape? 1.2:154/198),
          )
        ],
      ),
    );
  }
}

// return GridView.builder(
// gridDelegate:
// SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// itemBuilder: (context, index) {
// return DrinkItem(
// imageURI: items[index]["image"],
// itemTitle: items[index]["name"],
// itemPrice: items[index]["price"]);
// },
// itemCount: items.length,
// );

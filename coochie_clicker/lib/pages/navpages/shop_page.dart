import 'package:flutter/material.dart';
import 'package:coochie_clicker/library/globals.dart' as globals;


class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  static List<Shop> shopItems = [
    Shop(power: 'Fingers', amount: 2, effect: 'More coochies per tap', price: 69),
    Shop(power: 'Tim', amount: 1, effect: 'Get More Coochies each second', price: 420),
    Shop(power: 'Alcohol', amount: 17, effect: 'Multiplies the chances of getting laid', price: 720),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          centerTitle: true,
          title: Column(
              children: <Widget>[
                const Text('Shop',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text('Total Choochies: ${globals.counter}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
                children: shopItems.map((shopItem) => Card(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  color: Colors.greenAccent,
                  child: SizedBox(
                    width: 375,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        children: <Widget>[
                          Text('${shopItem.amount}X ${shopItem.power} -> ${shopItem.effect}'),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.black, width: 1),
                              backgroundColor: Colors.white,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                              onPressed: () {
                                if (shopItem.power == 'Tim' && globals.counter >= shopItem.price) {
                                  globals.buyTim();
                                } else if (shopItem.power == 'Fingers' && globals.counter >= shopItem.price) {
                                  globals.buyFinger();
                                } else if (shopItem.power == 'Alcohol' && globals.counter >= shopItem.price) {
                                  globals.buyAlcohol();
                                }
                              },
                            child: Text('${shopItem.price} Coochies', style: const TextStyle(color: Colors.black),))
                        ],
                      ),
                    ),
                  ),
              )).toList()
            ),
          ],
        ),
      ),
    );
  }
}

class Shop {

  String power ='';
  var amount = 0;
  String effect = '';
  var price = 0;

  Shop({ required this.power, required var this.amount, required this.effect, required var this.price });
}

import 'package:flutter/material.dart';
import 'package:coochie_clicker/library/globals.dart' as globals;

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPage();
}

class _ShopPage extends State<ShopPage> {

  void buyFinger() {
    setState(() {
      globals.counter -= shopItems[0].price;
      shopItems[0].price = shopItems[0].price * 1.05;
      shopItems[0].amount++;
      globals.fingerPower++;
    });
  }

  void buyTim() {
    setState(() {
      globals.counter -= shopItems[1].price;
      shopItems[1].price = shopItems[1].price * 1.1;
      shopItems[1].amount++;
      globals.timPunten++;

      globals.autoIncrement();
    });
  }

  void buyAlcohol() {
    setState(() {
      globals.counter -= shopItems[2].price;
      shopItems[2].price = shopItems[2].price * 1.5;
      shopItems[3].amount++;
      globals.multiplier ++;
    });
  }

  static List<Shop> shopItems = [
    Shop(power: 'Fingers', amount: 1, effect: 'More coochies per tap', price: 69.0),
    Shop(power: 'Tim', amount: 0, effect: 'Get More Coochies each second', price: 420.0),
    Shop(power: 'Alcohol', amount: 0, effect: 'Multiplies the chances of getting laid', price: 720.0),
  ];

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(currentHeight * 0.11),
        child: AppBar(
          toolbarHeight: currentHeight * 0.11,
          centerTitle: true,
          title: Column(
            children: <Widget>[
              const Text(
                'Shop',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                'Total Coochies: ${globals.counter.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: shopItems.map((shopItem) => Card(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  color: Colors.greenAccent,
                  child: SizedBox(
                    width: currentWidth,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Column(
                        children: <Widget>[
                          Text('${shopItem.amount}x ${shopItem.power} -> ${shopItem.effect}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.black, width: 1),
                                backgroundColor: Colors.white,
                                shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                              ),
                              onPressed: () {
                                if (shopItem.power == 'Tim' && globals.counter >= shopItem.price) {
                                  buyTim();
                                } else if (shopItem.power == 'Fingers' && globals.counter >= shopItem.price) {
                                  buyFinger();
                                } else if (shopItem.power == 'Alcohol' && globals.counter >= shopItem.price) {
                                  buyAlcohol();
                                }
                              },
                              child: Text(
                                '${shopItem.price.toStringAsFixed(2)} Coochies',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Shop {
  String power = '';
  var amount = 0;
  String effect = '';
  double price = 0;

  Shop({
    required this.power,
    required this.amount,
    required this.effect,
    required this.price,
  });
}
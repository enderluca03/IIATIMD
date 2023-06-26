import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  final VoidCallback buyOnePerSec;
  final VoidCallback buyTenPerSec;
  final VoidCallback buyHundredPerSec;

  const ShopPage({
    Key? key,
    required this.buyOnePerSec,
    required this.buyTenPerSec,
    required this.buyHundredPerSec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Shop Page'),
          ElevatedButton(
            onPressed: buyOnePerSec,
            child: const Text('Buy 1/sec'),
          ),
          ElevatedButton(
            onPressed: buyTenPerSec,
            child: const Text('Buy 10/sec'),
          ),
          ElevatedButton(
            onPressed: buyHundredPerSec,
            child: const Text('Buy 100/sec'),
          ),
        ],
      ),
    );
  }
}

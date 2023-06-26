import 'package:flutter/material.dart';
import 'dart:async';
import 'shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coochie Clicker',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Coochie Clicker Main Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  bool _isCounterActive = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 1) {
      _startIncrementTimer();
    } else {
      _stopIncrementTimer();
    }
  }

  void _startIncrementTimer() {
    if (_selectedIndex == 1 && !_isCounterActive) {
      _isCounterActive = true;
      _incrementCounter();
      Timer.periodic(const Duration(seconds: 1), (_) {
        _incrementCounter();
      });
    }
  }

  void _stopIncrementTimer() {
    _isCounterActive = false;
  }

  void _toggleCounter() {
    setState(() {
      _isCounterActive = !_isCounterActive;

      if (_isCounterActive) {
        _incrementCounter();
        Timer.periodic(const Duration(seconds: 1), (_) {
          _incrementCounter();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _selectedIndex == 0 ? _buildHomePage() : _buildShopPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHomePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Your Total Coochies:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline6,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            backgroundColor: Colors.transparent,
            child: const Image(image: AssetImage('assets/images/cookie.png')),
          ),
        ],
      ),
    );
  }

  Widget _buildShopPage() {
    List<Shop> shopItems = [
      Shop(power: 'Fingers', amount: 2, effect: 'More coochies per tap', price: 69),
      Shop(power: 'Tim', amount: 1, effect: 'Get More Coochies each second', price: 420),
      Shop(power: 'Alcohol', amount: 17, effect: 'Multiplies the changes of getting laid', price: 720),
    ];
    Widget shopTemplete(shop){
      return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: <Widget>[
            Text(
              shop.amount,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600]
              )
            ),
            const SizedBox(height: 6.0),
            Text(
                shop.power,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600]
                )
            ),
          ],
        ),
      );
    }


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Shop Page'),
          Column(
            children:
              shopItems.map((shopItem) =>
                  Card(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    color: Colors.redAccent,
                    child: SizedBox(
                      width: 375,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Column(
                            children: <Widget>[
                              Text('${shopItem.amount}X ${shopItem.power} -> ${shopItem.effect}'),
                              OutlinedButton( style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.black, width: 1),
                                backgroundColor: Colors.white,
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                                  onPressed: (){}, child: Text('${shopItem.price} Coochies', style: const TextStyle(color: Colors.black),)),
                            ],
                          ),

                        )
                    ),


                    )
              ).toList()
          ),
          // ElevatedButton(
          //   onPressed: _toggleCounter,
          //   child: Text(_isCounterActive ? 'Deactivate Counter' : 'Activate Counter'),
          // ),
        ],
      ),
    );
  }
}
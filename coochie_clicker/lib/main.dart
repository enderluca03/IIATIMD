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
      debugShowCheckedModeBanner: false,
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
  Set<int> _activeButtons = {};
  Timer? _timer;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _startIncrementTimer();
  }

  void _startIncrementTimer() {
    _stopIncrementTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      int totalCount = 0;
      for (int buttonIndex in _activeButtons) {
        totalCount += _getIncrementValue(buttonIndex);
      }
      setState(() {
        _counter += totalCount;
      });
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

  void _stopIncrementTimer() {
    _timer?.cancel();
  }

  void _toggleButton(int buttonIndex) {
    setState(() {
      if (_activeButtons.contains(buttonIndex)) {
        _activeButtons.remove(buttonIndex);
      } else {
        _activeButtons.add(buttonIndex);
      }
    });
    _startIncrementTimer();
  }

  int _getIncrementValue(int buttonIndex) {
    if (buttonIndex == 0) {
      return 1;
    } else if (buttonIndex == 1) {
      return 10;
    } else if (buttonIndex == 2) {
      return 100;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _selectedIndex == 0
          ? _buildHomePage()
          : ShopPage(
        activeButtons: _activeButtons,
        toggleButton: _toggleButton,
      ),
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
}

class ShopPage extends StatelessWidget {
  final Set<int> activeButtons;
  final Function(int) toggleButton;

  const ShopPage({
    Key? key,
    required this.activeButtons,
    required this.toggleButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Shop> shopItems = [
      Shop(power: 'Fingers',
          amount: 2,
          effect: 'More coochies per tap',
          price: 69),
      Shop(power: 'Tim',
          amount: 1,
          effect: 'Get More Coochies each second',
          price: 420),
      Shop(power: 'Alcohol',
          amount: 17,
          effect: 'Multiplies the changes of getting laid',
          price: 720),
    ];

    return Column(
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
                        Text('${shopItem.amount}X ${shopItem
                            .power} -> ${shopItem.effect}'),
                        OutlinedButton(style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.black, width: 1),
                          backgroundColor: Colors.white,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                            onPressed: () => {
                              $_counter
                            },
                            child: Text('${shopItem.price} Coochies',
                              style: const TextStyle(
                                  color: Colors.black),)),
                      ],
                    ),
                  )
              ),
            )
        ).toList()
    );
  }

  ButtonStyle _getButtonStyle(bool isActive) {
    return isActive
        ? ElevatedButton.styleFrom(primary: Colors.green)
        : ElevatedButton.styleFrom(primary: Colors.blue);
  }
}

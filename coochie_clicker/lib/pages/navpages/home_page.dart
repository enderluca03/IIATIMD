import 'package:flutter/material.dart';
import 'package:coochie_clicker/library/globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void incrementCounter() {
    setState(() {
      globals.counter = globals.counter + (globals.fingerPower * globals.multiplier);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(currentHeight * 0.11),
        child: AppBar(
          toolbarHeight: currentHeight * 0.11,
          centerTitle: true,
          title: Column(
            children: <Widget>[
                    const Text(
                      'Your Total Coochies:',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      globals.counter.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
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

            Container(
              margin: const EdgeInsets.all(32),
              child: SizedBox(
                width: 150,
                height: 150,
                child: FloatingActionButton(
                  onPressed: incrementCounter,
                  tooltip: 'Increment',
                  backgroundColor: Colors.transparent,
                  mini: false,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  heroTag: null,
                  elevation: 6.0,
                  child: const Image(
                    width: 1069, // Adjust the width as per your requirement
                    height: 1069, // Adjust the height as per your requirement
                    image: AssetImage('assets/images/cookie.png'),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(32, 80, 24, 24),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,

              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Finger power: ${globals.fingerPower.round()}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Coochies per second: ${globals.timPunten.round()}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Multiplier: ${globals.multiplier.round()}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:coochie_clicker/library/globals.dart' as globals;
import 'package:shake/shake.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        incrementCounter();
        print('shake');
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  void incrementCounter() {
        setState(() {
          globals.counter =
              (globals.counter + globals.fingerPower) * globals.multiplier;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your Total Coochies:',
            ),
            Text(
              '${globals.counter}',
              style: Theme.of(context).textTheme.headline6,
            ),
            FloatingActionButton(
              onPressed: incrementCounter,
              tooltip: 'Increment',
              backgroundColor: Colors.transparent,
              child: const Image(image: AssetImage('assets/images/cookie.png')),
            ),
          ],
        ),
      ),
    );
  }
}

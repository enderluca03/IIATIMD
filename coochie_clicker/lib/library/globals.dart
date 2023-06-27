library my_prj.globals;

import 'dart:async';

int counter = 0;
int fingerPower = 1;
int timPunten = 0;
int multiplier = 1;

void autoIncrement() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      counter = counter + timPunten;
      print(counter);
    });
}

void buyTim() {}

void buyFinger() {}

void buyAlcohol(){}
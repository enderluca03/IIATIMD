import 'dart:async';

double counter = 0;
double fingerPower = 1;
double timPunten = 0;
double multiplier = 1;



void autoIncrement() {
  Timer.periodic(const Duration(seconds: 1), (_) {
    counter += timPunten;
    print(counter);
  });
}


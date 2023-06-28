import 'dart:async';
import 'package:coochie_clicker/pages/navpages/shop_page.dart' show ShopPage;

int counter = 60;
int fingerPower = 1;
int timPunten = 0;
int multiplier = 1;

void autoIncrement() {
  Timer.periodic(const Duration(seconds: 1), (_) {
    counter = counter + timPunten;
    print(counter);
  });
}

void buyFinger() {
  counter -= ShopPage.shopItems[0].price;
  print("Finger Test");
}

void buyTim() {
  counter -= ShopPage.shopItems[1].price;
  print("Tim Test");
}

void buyAlcohol() {
  counter -= ShopPage.shopItems[2].price;
  print("Alcohol Test");
}

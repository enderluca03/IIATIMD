import 'dart:async';
import 'package:coochie_clicker/pages/navpages/shop_page.dart' show ShopPage;

int counter = 410;
int fingerPower = 1;
int timPunten = 0;
int multiplier = 1;

void autoIncrement() {
  Timer.periodic(const Duration(seconds: 1), (_) {
    counter += timPunten; // Add timPunten to counter every second
    print(counter);
  });
}

void buyFinger() {
  counter -= ShopPage.shopItems[0].price;
  ShopPage.shopItems[0].price += 1;
  fingerPower++;
  print(fingerPower);
  print(ShopPage.shopItems[0].price);
}

void buyTim() {
  counter -= ShopPage.shopItems[1].price;
  ShopPage.shopItems[1].price += 1;
  timPunten++;

  autoIncrement();
  print("Auto increment started");
  print(timPunten);
  print(ShopPage.shopItems[1].price);
}

void buyAlcohol() {
  counter -= ShopPage.shopItems[2].price;
  print("Alcohol Test");
}
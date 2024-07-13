import "package:flutter/material.dart";

class ProviderModel extends ChangeNotifier{
  double balance = 900.00;
  double get_balance() => balance;
  final controller = TextEditingController();
  final intcontroller = TextEditingController();

  List purchases = [
    ["Start", 0.0]
  ];

  void savePurchase() {
    double purchaseAmount = double.tryParse(intcontroller.text) ?? 0;
    purchases.add([controller.text, purchaseAmount]);
    minusBal(purchaseAmount);
    controller.clear();
    intcontroller.clear();
    notifyListeners();
  }
  
  
  void deletePurchase(int index) {
    balance += purchases[index][1];
    purchases.removeAt(index);
    print(purchases);
    notifyListeners();
  }

  void minusBal(double bal) {
    balance -= bal;
  }

  

}
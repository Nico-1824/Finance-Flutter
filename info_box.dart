import 'package:flutter/material.dart';
import "package:finance/pages/home.dart";
import "package:finance/pages/BalanceStatistic.dart";
import "package:finance/pages/provider_model.dart";
import 'package:provider/provider.dart';

class InfoBox extends StatelessWidget {
  final String name;
  final double number;
  final int index;

  InfoBox({
    required this.name, 
    required this.number, 
    required this.index
    });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) => Dismissible(
        key: Key(name),
        onDismissed:(direction) {
          final provider = context.read<ProviderModel>();
          provider.deletePurchase(index);
        },
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Container(
                child: Text(name,
                  style: TextStyle(
                    fontSize: 25)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Text(number.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
            ],
          )
        )
      ),
    ),
    );
  }
}
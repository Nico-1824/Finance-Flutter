import 'dart:ui';

import 'package:finance/pages/dialog_box.dart';
import 'package:finance/pages/BalanceStatistic.dart';
import 'package:finance/pages/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key); // Corrected super constructor

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

//###########################################################################################\\
// UI CODE

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(
      builder: (context, value, child) =>
        Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: AppBar(
            backgroundColor: Colors.blue[300],
            title: const Text(
              "Finance",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
                
              )),
          ),
          //Add Button
          floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => DialogBox(
                      controller: value.controller,
                      intcontroller: value.intcontroller,
                      onSave: () {
                        final provider = context.read<ProviderModel>();
                        provider.savePurchase();
                        Navigator.pop(context);
                      }

                      )
                    );                  
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.blue[300],
                
                
              );
            }
          ),
  //###########################################################################################\\
          body: Center(
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(30)
              ),
              //Balance Display
              child: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => BalanceStatistic(
                          listData: value.purchases, 
                          )
                        )
                      );
                    },
                    child: Hero(
                      tag: 'balance_display',
                      child: Center(
                        child: Text(
                          value.balance.toString(),
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold
                            ),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ),
    );
  }
}

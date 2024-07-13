import "package:finance/pages/info_box.dart";
import "package:finance/pages/home.dart";
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:finance/pages/provider_model.dart";


class BalanceStatistic extends StatefulWidget {

  final List listData;
  

  BalanceStatistic({
    required this.listData, 
  });

    

  @override
  State<BalanceStatistic> createState() => _BalanceStatisticState();
}

class _BalanceStatisticState extends State<BalanceStatistic> {
  @override
  Widget build(BuildContext context) {
    //Second Screen
    return Consumer<ProviderModel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Balance Statistic",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
          backgroundColor: Colors.blue[300],
        ),
        body: Column(
          children: [
            Hero(tag: 'balance_display', 
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    value.balance.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
            ),
            Flexible(
              child: Builder(
                builder: (context) {
                  return ListView.builder(
                    itemCount: widget.listData.length,
                    itemBuilder: (context, index) {
                      String pname = widget.listData[index][0];
                      double pnumber = widget.listData[index][1];
                  
                      return InfoBox(
                        name: pname,
                        number: pnumber, 
                        index: index
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[200],
      ),
    );
  }
}
import 'dart:math';
import 'dart:ui';
import 'dart:async';


import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController intcontroller;
  final VoidCallback onSave;

  DialogBox({
    super.key, 
    required this.controller, 
    required this.intcontroller, 
    required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 200,
        child: Column(
          children: [
            //Puchase Input TextField
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                color: Colors.grey[500],
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Type your Purchase"),
                ),
              ),
            ),
            //Amount TextField
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                color: Colors.grey[500],
                child: TextField(
                  controller: intcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Amount"),
                ),
              ),
            ),
            Row(
              children: [
                //Save Button
                MaterialButton(
                  color: Colors.grey[200],
                  onPressed: onSave,
                  child: Text("Save"),
                ),                  
              ],
            )
          ],
        ),
      ),
    );
  }
}
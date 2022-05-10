// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Usd extends StatefulWidget {
  String? high;
  String? low;
  Usd({this.high, this.low});

  @override
  _UsdState createState() => _UsdState();
}

class _UsdState extends State<Usd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cotação De Moedas",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Preço mais Alto : R\$ ${widget.high}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Preço mais Baixo : R\$ ${widget.low}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Voltar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Bitcoin extends StatefulWidget {
  String? buy;
  String? sell;
  Bitcoin({this.buy, this.sell});

  @override
  _BitcoinState createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
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
              "Preço de Compra : R\$ ${widget.buy}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Preço de Venda : R\$ ${widget.sell}",
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

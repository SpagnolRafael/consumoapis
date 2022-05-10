// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:preco_bitcoin/bitcoin.dart';
import 'package:preco_bitcoin/eur.dart';
import 'package:preco_bitcoin/usd.dart';

class Cotacao extends StatefulWidget {
  const Cotacao({Key? key}) : super(key: key);

  @override
  _CotacaoState createState() => _CotacaoState();
}

class _CotacaoState extends State<Cotacao> {
  String? uSDview = "";
  String? eUview = "";
  String? bTCview = "";
  String? eTHview = "";
  String? EUh = "";
  String? EUl = "";
  String? USDh = "";
  String? USDl = "";
  String? bTCb = "";
  String? bTCs = "";

  void _atualizarPreco() async {
    var urlUSD = "http://economia.awesomeapi.com.br/json/last/USD-BRL";
    http.Response response;
    response = await http.get(Uri.parse(urlUSD));
    Map<String, dynamic> retorno = json.decode(response.body);

    USDh = retorno["USDBRL"]["high"].toString();
    USDl = retorno["USDBRL"]["low"].toString();
    double.parse(USDh!);
    double.parse(USDl!);
    setState(() {
      uSDview = ((double.parse(USDh!) + double.parse(USDl!)) / 2).toString();
    });

    var urlEU = "http://economia.awesomeapi.com.br/json/last/EUR-BRL";
    http.Response response1;
    response1 = await http.get(Uri.parse(urlEU));
    Map<String, dynamic> retorno1 = json.decode(response1.body);

    EUh = retorno1["EURBRL"]["high"].toString();
    EUl = retorno1["EURBRL"]["low"].toString();
    double.parse(EUh!);
    double.parse(EUl!);
    setState(() {
      eUview = ((double.parse(EUh!) + double.parse(EUl!)) / 2).toString();
    });

    var urlBTC = "https://blockchain.info/ticker";
    http.Response response2;
    response2 = await http.get(Uri.parse(urlBTC));
    Map<String, dynamic> retorno2 = json.decode(response2.body);

    setState(() {
      bTCview = retorno2["BRL"]["buy"].toString();
      bTCb = bTCview;
      bTCs = retorno2["BRL"]["sell"].toString();
    });

    var urlETH =
        "https://api.coingecko.com/api/v3/simple/price?ids=eth&vs_currencies=25&include_market_cap=true&include_24hr_vol=true&include_24hr_change=true&include_last_updated_at=true";
    http.Response response3;
    response3 = await http.get(Uri.parse(urlETH));
    Map<String, dynamic> retorno3 = json.decode(response3.body);

    // var ETHh = retorno3["ETHBRL"]["high"].toString();
    // var ETHl = retorno3["ETHBRL"]["low"].toString();
    // double.parse(ETHh);
    // double.parse(ETHl);
    setState(() {
      eTHview = retorno3["eth"]["price"].toString();
    });
  }

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Cotação Atual dos Ativos Listados Abaixo: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Usd(
                                        high: USDh,
                                        low: USDl,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Dolar: ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          Text(
                            "R\$ $uSDview",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Eur(
                                        high: EUh,
                                        low: EUl,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Euro: ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          Text(
                            "R\$ $eUview",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Bitcoin(
                                        buy: bTCb,
                                        sell: bTCs,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Bitcoin: ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          Text(
                            "R\$ $bTCview",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Padding(
                      //       padding: EdgeInsets.all(15),
                      //       child: Text(
                      //         "Ethereum: ",
                      //         textAlign: TextAlign.start,
                      //         style: TextStyle(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //     Text(
                      //       "R\$ $eTHview",
                      //       textAlign: TextAlign.start,
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: ElevatedButton(
                  onPressed: _atualizarPreco,
                  child: Text(
                    "Atualizar",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

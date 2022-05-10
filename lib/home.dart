// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _resultado = "Clique para Pesquisar";
  var cepDigitado = "";
  var cepPesquisa = "";
  TextEditingController _controllerCEP = TextEditingController();

  _recuperarCEP() async {
    cepDigitado = _controllerCEP.text;
    var url = "https://viacep.com.br/ws/$cepDigitado/json/";
    http.Response response;
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String complemento = retorno["complemento"];
    String localidade = retorno["localidade"];

    setState(() {
      _resultado =
          "Rua/Av: $logradouro, \n\nComplemento: $complemento, \n\nBairro: $bairro \n\nCidade: $localidade";
    });
    _controllerCEP.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cotação Moedas",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          40,
        ),
        child: Column(
          children: [
            TextField(
              controller: _controllerCEP,
              decoration: InputDecoration(
                label: Text("Digite o CEP"),
              ),
              maxLengthEnforced: true,
              maxLength: 8,
              keyboardType: TextInputType.number,
            ),
            Text(
              _resultado!,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            ElevatedButton(
              onPressed: _recuperarCEP,
              child: const Text(
                "Buscar",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Combustivel extends StatefulWidget {
  @override
  _CombustivelState createState() => _CombustivelState();
}

class _CombustivelState extends State<Combustivel> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    void _calcular() {
      double precoAlcool = double.tryParse(_controllerAlcool.text);
      double precoGasolina = double.tryParse(_controllerGasolina.text);

      void _limparCampos() {
        _controllerAlcool.text = "";
        _controllerGasolina.text = "";
      }

      print("Chega aqui");

      if (precoAlcool == null || precoGasolina == null) {
        setState(() {
          _resultado =
              "Você passou o valor do álcool e/ou gasolina com vírgula. Deveria ser ponto";
        });
      } else {
        if ((precoGasolina * 0.7) >= precoAlcool) {
          print("Chega no Alcool");
          setState(() {
            _resultado = "Abasteca com Alcool";
          });
        } else {
          print("Chega na gasolina");
          setState(() {
            _resultado = "Abasteca com gasolina";
          });
        }
        _limparCampos();
      }
    }

    return Scaffold(
        appBar: AppBar(title: Text("Álcool ou Gasolina?")),
        body: Container(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Saiba qual a melhor opção para o seu carro"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço do alcool, ex:1.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço da gasolina, ex:1.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                  textColor: Colors.white,
                  color: Colors.indigo,
                  onPressed: () {
                    _calcular();
                  },
                  child: Text("Clique para calcular"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        )));
  }
}

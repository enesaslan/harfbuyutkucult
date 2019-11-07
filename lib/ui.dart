import 'package:flutter/material.dart';

class Arayuz extends StatefulWidget {
  @override
  _ArayuzState createState() => _ArayuzState();
}

class _ArayuzState extends State<Arayuz> {
  var cevrilecekMetin = TextEditingController();
  String cikti = "";
  String mesaj = "";

  int seciliRadio;

  @override
  void initState() {
    super.initState();
    seciliRadio = 0;
  }

  radioSec(int gelenDeger) {
    setState(() {
      seciliRadio = gelenDeger;
    });
  }

  cevir() {
    setState(() {
      if (seciliRadio == 0) {
        setState(() {
          cikti = cevrilecekMetin.text;
          mesaj = cikti.toUpperCase();
        });
      } else if (seciliRadio == 1) {
        setState(() {
          cikti = cevrilecekMetin.text;
          mesaj = cikti.toLowerCase();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CapsLocker"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: cevrilecekMetin,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Çevirilecek Metni Giriniz"),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text("Büyüt"),
                  Radio(
                    value: 0,
                    groupValue: seciliRadio,
                    onChanged: (value) {
                      radioSec(value);
                      print(seciliRadio);
                    },
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 30.0, color: Colors.grey[800]),
                  ),
                  VerticalDivider(),
                  Text("Küçült"),
                  Radio(
                    value: 1,
                    groupValue: seciliRadio,
                    onChanged: (value) {
                      radioSec(value);
                      print(seciliRadio);
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Çevir"),
                      onPressed: () => cevir(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SelectableText("$mesaj"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cotacao/components/paisCotacaoCard.dart';
import 'package:cotacao/models/cotacao_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

class PriceDetailsScreen extends StatefulWidget{
  final CotacaoModel cotacaoModel;
  PriceDetailsScreen({required this.cotacaoModel}): super();

  @override
  _PriceDetailsScreenState createState() => _PriceDetailsScreenState();
}

class _PriceDetailsScreenState extends State<PriceDetailsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ), 
      body: Container(
        child: Column(
          children: [
            PaisCotacaoCard(image: 'assets/imagens-moedas/'
                '${widget.cotacaoModel.symbol}.png',
                width: 50),
            SizedBox(height: 20,),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text("Compra"),
                    leading: Text(widget.cotacaoModel.symbol),
                    trailing: Text(Money.fromNum(widget.cotacaoModel.buy,
                        isoCode: widget.cotacaoModel.symbol).toString()
                    ),
                  ),
                  ListTile(
                    title: Text("Venda"),
                    leading: Text(widget.cotacaoModel.symbol),
                    trailing: Text(Money.fromNum(widget.cotacaoModel.sell,
                        isoCode: widget.cotacaoModel.symbol).toString()
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}


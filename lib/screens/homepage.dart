import 'package:cotacao/components/paisCotacaoCard.dart';
import 'package:cotacao/controllers/list_currencies_controller.dart';
import 'package:cotacao/screens/price_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ListCurrenciesController.listsCurrencies;
  @override
  void initState(){
    super.initState();
    controller.listCurrencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: 
        Obx(() => controller.isLoading.value ? 
        Center(
          child: CircularProgressIndicator(),) : 
            Container(
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: controller.listCurrenciesObs.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      child: ListTile(
                        onTap: (){
                          Get.to(PriceDetailsScreen(
                              cotacaoModel: controller.listCurrenciesObs[index])
                          );
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(8.0),
                          child:
                          PaisCotacaoCard(
                                image: 'assets/imagens-moedas/${controller.listCurrenciesObs[index].symbol}.png',
                                width: 50
                            )
                        ),
                        title: Text(Money.fromNum(
                          controller.listCurrenciesObs[index].buy,
                          isoCode: controller.listCurrenciesObs[index].symbol).toString()
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    );
                  }
              ),
            )
        )
    );
  }
}
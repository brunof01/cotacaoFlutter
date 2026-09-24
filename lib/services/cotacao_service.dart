import 'dart:convert';

import 'package:cotacao/models/list_currencies_model.dart';
import 'package:http/http.dart' as http;

class CotacaoService {
  String url = "https://blockchain.info/ticker";
  dynamic _response;
  CotacaoService(){
    _response = "";
  }
  Future<ListCurrencies> fetchListCurrencies() async{
    _response = await http.get(Uri.parse(url));
    if (_response.statuCode == 200){
      Map<String, dynamic> retorno = json.decode(_response.body);
      return ListCurrencies.fromJson(retorno);
    } else{
      throw Exception('Erro paizão, arruma ai blz');
    }
  }
}
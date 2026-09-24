import 'cotacao_model.dart';

class ListCurrencies {
  final List<CotacaoModel> listCurrencies;
  ListCurrencies(this.listCurrencies);
  ListCurrencies.fromJson(Map<String, dynamic> json) :
      listCurrencies = List.from(json.values).map((item) => CotacaoModel.fromJson(item)).toList();

}
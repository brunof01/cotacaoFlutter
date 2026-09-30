import 'package:cotacao/models/cotacao_model.dart';
import 'package:cotacao/services/cotacao_service.dart';
import 'package:get/get.dart';

class ListCurrenciesController extends GetxController{
  CotacaoService cotacaoService = CotacaoService();
  var isLoading = false.obs;
  var listCurrenciesObs = <CotacaoModel>[].obs;
  static ListCurrenciesController get listsCurrencies => Get.find();
  Future<dynamic> listCurrencies() async{
    isLoading.value = true;
    var list = await cotacaoService.fetchListCurrencies();
    listCurrenciesObs.value = list.listCurrencies;
    isLoading.value = false;
    return listCurrenciesObs;
  }
}
import 'package:cotacao/controllers/list_currencies_controller.dart';
import 'package:cotacao/models/list_currencies_model.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ListCurrenciesController>(()=> ListCurrenciesController());
  }

}
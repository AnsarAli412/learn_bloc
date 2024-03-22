import 'package:get/get.dart';

class GetBasicController extends GetxController{
  var count = 0.obs;

  increment(){
    count++;
    update();
  }
  decrement(){
    count--;
    update();
  }
}
import 'package:dio/dio.dart';
class ApiController{
  static const baseUrl = "";
  var dio = Dio();
  getHttpRequest({String path = baseUrl})async{
    var res = await dio.get(path);
    if(res.statusCode == 200){
      return res.data;
    }else{

    }
  }

}
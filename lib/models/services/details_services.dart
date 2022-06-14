import 'dart:convert';
import 'dart:io';

import 'package:movia_app/core/app_excaption.dart';
import 'package:movia_app/core/base_service.dart';
import 'package:http/http.dart' as http;
 
class DetailsService extends BaseService{


  dynamic responseJson;

  @override
  Future getResponse(String url) async{
    try{
      final response = await http.put(Uri.parse(baseURL + url + apiKey));
      responseJson = returnResponse(response);
    }on SocketException{
      throw Exception('Internet bilan muammo bor');
    }

    return responseJson;

  }
  dynamic returnResponse( http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.statusCode.toString());

      case 401:
        throw UnauthorizedException(response.statusCode.toString());

      case 404:
        throw NotFoundException(response.statusCode.toString());

      default :
        throw Exception(response.statusCode.toString());
    }
  }

}
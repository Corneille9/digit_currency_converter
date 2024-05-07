import 'dart:developer' as dev;

import 'package:digit_currency_converter/src/common/ip_info.dart';
import 'package:digit_currency_converter/src/core/http_client.dart';

void logger({Object? message, Object? error,StackTrace? stackTrace}){
  dev.log(message.toString(), name: "DIGIT CURRENCY CONVERTER", error: error, stackTrace: stackTrace);
}

Future<IpInfo?> getInfo() async {
  var client = HttpClient("ip-api.com", useHttps: false);
  var response = await client.get("/json", queryParameters: {"fields": 8413695.toString()});

  if(response.isFailed) return null;

  return IpInfo.fromMap(response.data);
}
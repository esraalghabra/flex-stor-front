import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommercecourse/core/constant/status_view.dart';
import 'package:ecommercecourse/core/constant/status_code_request.dart';
import 'package:ecommercecourse/core/functions/checkinternet.dart';
import 'package:ecommercecourse/core/functions/debug.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<Either<StatusView, Map>> post(String url, Map data) async {
      printNote('Start post ApiService');
      try{
        if (await checkInternet()) {
          printNote('post ApiService checkInternet SUCCESS');
          var response = await http.post(Uri.http(AppLink.server,url), body: data);
          if (response.statusCode == StatusCodeRequest.OK ||response.statusCode == StatusCodeRequest.CREATED || response.statusCode == StatusCodeRequest.BAD_REQUEST) {
            printNote('post ApiService response success');
            return Right(jsonDecode(response.body));
          } else if(response.statusCode ==  StatusCodeRequest.NO_CONTENT) {
            printNote('post ApiService NO_CONTENT');
            return const Left(StatusView.noContent);
          }else{
            printNote('post ApiService serverFailure ${response.statusCode}');
            return const Left(StatusView.serverFailure);
          }
        } else {
          printNote('post ApiService offlineFailure');
          return const Left(StatusView.offlineFailure);
        }
      }catch(e){
        printNote('post ApiService unKnownException: $e');
        return const Left(StatusView.unKnownException);
      }
  }

  Future<Either<StatusView, Map>> get(String url,Map<String,String> headers) async {
      printNote('Start get ApiService');
      try{
        if (await checkInternet()) {
          printNote('get ApiService checkInternet SUCCESS');
          var response = await http.get(Uri.http(AppLink.server,url),headers: headers);
          if (response.statusCode == StatusCodeRequest.OK) {
            printNote('get ApiService response success');
            return Right(jsonDecode(response.body));
          } else if(response.statusCode ==  StatusCodeRequest.NO_CONTENT) {
            printNote('get ApiService NO_CONTENT');
            return const Left(StatusView.noContent);
          }else{
            printNote('get ApiService serverFailure ${response.statusCode}');
            return const Left(StatusView.serverFailure);
          }
        } else {
          printNote('get ApiService offlineFailure');
          return const Left(StatusView.offlineFailure);
        }
      }catch(e){
        printNote('get ApiService unKnownException: $e');
        return const Left(StatusView.unKnownException);
      }
  }
}

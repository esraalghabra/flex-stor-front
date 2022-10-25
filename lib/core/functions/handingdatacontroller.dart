import 'package:ecommercecourse/core/constant/status_view.dart';

handlingData(response){
  if (response is StatusView){
   return response ; 
  }else {
   return StatusView.ok ;
  }
}
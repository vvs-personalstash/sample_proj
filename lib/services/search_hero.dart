import 'package:flutter/material.dart';

List<dynamic> searchHero(List<dynamic> data,String name){
  name=name.toLowerCase();
  List<dynamic> result= [];
  for(dynamic item in data){
    if(item['name'].toString().toLowerCase().contains(name) || item['biography']['fullName'].toString().toLowerCase().contains(name)||item['connections']['groupAffiliation'].toString().toLowerCase().contains(name)) {
      result.add(item);
    }
  }
  print('before');
  print(result);
  return result;
}
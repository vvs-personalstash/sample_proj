import 'package:flutter/material.dart';
import 'networking.dart';
import 'dart:math';

class UrlList {
  List<String> urlList = [];
  Future<void> initialise() async {
    for (int i = 1; i < 10; i++) {
      var data = await NetworkHelper(
              url: 'https://superheroapi.com/api/283447910281540/$i')
          .getData();
      print(data);
      urlList.add(data['image']['url']);
    }
  }
}

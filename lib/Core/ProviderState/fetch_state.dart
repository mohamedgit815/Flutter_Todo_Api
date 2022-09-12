import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class FetchData extends ChangeNotifier {
  List<dynamic> dataList = [];
  bool hasMore = true;


  Future<void> fetchData({ required String url , required int limit,required int page }) async {
    final http.Response response = await http.get(Uri.parse(url));
    final List<dynamic> data = await jsonDecode(response.body);


    if(response.statusCode == 200 ) {

      if(response.contentLength! <= 2) {
        hasMore = false;
      } else {
        hasMore = true;
      }

      dataList.addAll(data.map((e) => e).toList());

      notifyListeners();

    }
  }


  Future<void> fetchDataByResult({
    required String url , required result ,
    required int limit , required int page
  }) async {
    final http.Response response = await http.get(Uri.parse(url));
    final Map<String,dynamic> map = await jsonDecode(response.body);
    final List<dynamic> data = map[result];


    //print("${response.contentLength} Google${map['length']}");

    if( response.statusCode == 200 ) {

     // if(response.contentLength! <= 2) {
      if(map['length']  <= 1) {
        hasMore = false;
      } else {
        hasMore = true;
      }

      dataList.addAll(data.map((e) => e).toList());

      notifyListeners();

    }
  }


  Future<void> refreshData(int page) async {
    hasMore = false;
    page = 1;
    dataList.clear();
    notifyListeners();
  }

}
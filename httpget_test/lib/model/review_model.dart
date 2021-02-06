import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class Review {
  dynamic time;
  dynamic writer;
  dynamic name;
  dynamic lat;
  dynamic lng;
  dynamic pic_url;
  dynamic thumbnail_url;
  dynamic communication;
  dynamic kindness;
  dynamic rating;
  dynamic parking;
  dynamic comment;
  dynamic goodvote;
  dynamic badvote;

//  Review.fromJson()
//  {
//
//  }

}


class ReviewModel with ChangeNotifier {
  List<Review> Reviews;

//  ReviewModel.fromJson()
//  {
//
//  }

  String getUrl() {
    return "https://us-central1-slientfestival.cloudfunctions.net/reviews";
  }

  Future<int> fetchData() async {
    // TODO 5
    //print('fetching..');
    var dio = Dio();
    Response response;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;

    //response = await dio.get(this.getUrl());
    this.Reviews = [];
    notifyListeners();
    try {
      //404
      response = await dio.get(this.getUrl());
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('brach1' + response.statusCode.toString());
        return response.statusCode;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print('brach2' + response.statusCode.toString());
        return response.statusCode;
      }
    }
  }

  void _initFetchData() async
  {
    int _statusCode;
    do {
      _statusCode = await this.fetchData();
    }
    while (_statusCode != 200);
  }
}

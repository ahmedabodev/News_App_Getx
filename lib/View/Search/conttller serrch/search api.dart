import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_with_getx/Models/articles.dart';
import 'package:http/http.dart'as http;
class Searchapi extends GetxController{
  List<articles>news=[];
  String query='';
  Search(String value){
    query=value;
    gethomedata();
    update();
    news.clear();

  }



  Searchapi(){
    gethomedata();
  }
  Future gethomedata()async{
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/everything?q=${query}&apiKey=c9490d45393f4ff6b93ea9804d51a788');
      var respone = await http.get(url);
      var responebody = jsonDecode(respone.body)['articles'];
      print(responebody);
      print(respone.statusCode);

      for (int x = 0; x < responebody.length; x++) {
        news.add(articles.fromMap(responebody[x]));

      }
      // CacheHelper.saveData(key: 'key', value: newss);
    } catch (e) {
      print('error=<<<<<$e');
    }
    update();
  }

}
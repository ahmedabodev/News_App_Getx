import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_with_getx/View/Search/conttller%20serrch/search%20api.dart';

class SearchScreen extends StatelessWidget {
final Searchapi c=Get.put(Searchapi());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged:(String value){
            c.Search(value);
          },

        ),
      ),
      body: Column(
        children: [
          GetBuilder<Searchapi>(
            builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.news.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius:const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child:(controller.news[index].urlToImage==null)?Image.network('https://images.unsplash.com/photo-1628155930542-3c7a64e2c833?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'): Image.network(
                                    controller.news[index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              Text(controller.news[index].title.toString()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

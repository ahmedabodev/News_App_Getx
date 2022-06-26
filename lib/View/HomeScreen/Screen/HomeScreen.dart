import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_with_getx/View/Search/SearchScreen.dart';

import '../../../Contlloer/GetData.dart';
import '../../../services/openlink.dart';
import '../../../services/share.dart';
enum Menu { us,eg, fr, de }

class HomeScreen extends StatelessWidget {

  final NewsData c = Get.put(NewsData());
  List<String> Category = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'entertainment',
    'technology',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(onPressed: (){
            Get.to(SearchScreen());
          }, icon: Icon(Icons.search)),
          PopupMenuButton<Menu>(
            // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {

                  c.ChnageCountery(item.name);

              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  value: Menu.eg,
                  child: Text('Egypt'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.us,
                  child: Text('United states'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.fr,
                  child: Text('France'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.de,
                  child: Text('Germany'),
                ),
              ]),

        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text('Country'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
         const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: Category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    elevation: 5,
                    color: Colors.teal,
                    onPressed: () {
                      c.ChangeCategory(Category[index]);
                    },
                    child: Text(Category[index]),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          GetBuilder<NewsData>(
            builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.news.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: (){
                          openlink('${controller.news[index].url}');
                        },
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
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height/17,



                                child: MaterialButton(
                                  elevation: 5,
                                  color: Color(0xffa32a2a),
                                  onPressed: () {
                                    sharelink(
                                        '${controller.news[index].url}');
                                  },
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)


                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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

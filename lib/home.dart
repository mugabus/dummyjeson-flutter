import 'package:api/controller/product_controller.dart';
import 'package:api/repos/product_repo.dart';
import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Center(
          child: Text("flutter Apis"),
        ),
      ),
      body: FutureBuilder(
        future: ProductController().getProduct(),
        builder: (context, snapshot) {
          snapshot.data;
          if (snapshot.data == null){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
             return Container(
               padding: EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(products[index].title,style: TextStyle(fontSize: 20.0)),
                   Text(products[index].description),
                 ],
               ),
             );
            },
          );
        }
      ),
    );
  }
}

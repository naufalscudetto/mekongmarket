import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mekong_market/common/loader.dart';
import 'package:mekong_market/constants/global_variables.dart';
import 'package:mekong_market/features/home/services/home_services.dart';
import 'package:mekong_market/models/product.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen ({ Key? key, required this.category}) : super(key: key);

  @override 
  State<CategoryDealsScreen > createState() => _CategoryDealsScreen ();
}

class _CategoryDealsScreen  extends State<CategoryDealsScreen >{
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState(){
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await  homeServices.fetchCategoryProducts(context: context, category: widget.category);
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),

      body: productList == null ? const Loader() : Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text('Shop for ${widget.category}', 
            style: const TextStyle(
              fontSize: 20,
            ),
            ),
          ),
          SizedBox(
            height: 170,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              itemCount: productList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio:  1.4, mainAxisSpacing: 10 ),
              itemBuilder: (context, index){
                final Product = productList![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 130,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 0.5,)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                        child: Image.network(Product.images[0],),),
                        ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 0, top: 5, right: 15,
                      ),
                      child: Text(Product.name, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                );
              }),
          ),
        ],
      ),

    );
  }
}
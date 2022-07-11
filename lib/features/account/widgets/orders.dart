import 'package:flutter/material.dart';
import 'package:mekong_market/constants/global_variables.dart';
import 'package:mekong_market/features/account/widgets/single_product.dart';

class Orders extends StatefulWidget{
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders>{

  List list = [
    'https://images.unsplash.com/photo-1603546609526-2fc9c4cf48c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnB8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60',
    'https://images.unsplash.com/photo-1603546609526-2fc9c4cf48c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnB8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60',
    'https://images.unsplash.com/photo-1603546609526-2fc9c4cf48c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnB8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60',
    'https://images.unsplash.com/photo-1603546609526-2fc9c4cf48c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnB8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'Fish Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),

              //Display Orders
              Container(
                height: 170,
                padding: const EdgeInsets.only(
                  left: 10, 
                  top: 20, 
                  right: 0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return SingleProduct(image: list[index]);
                  },  
              ),
              ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mekong_market/constants/global_variables.dart';
import 'package:mekong_market/features/account/widgets/below_app_bar.dart';
import 'package:mekong_market/features/account/widgets/orders.dart';
import 'package:mekong_market/features/account/widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/mekongmarketlogo2.png', width: 180, height: 150,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: const [
                  Padding(padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.notifications_outlined),
                  ),
                  Icon(Icons.search),
                ],
              ),
            )
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
          Orders()
        ],
      )
    );
  }
  
}
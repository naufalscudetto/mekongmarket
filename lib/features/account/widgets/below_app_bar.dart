import 'package:flutter/material.dart';
import 'package:mekong_market/constants/global_variables.dart';
import 'package:mekong_market/providers/user_provider.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
        RichText(
        
        text: TextSpan(
          text: 'Welcome ',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: 'Raleway', 
          ),

          children: [
            TextSpan(
          text: user.name,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            ),
          ),
          ],
          
          ),
        ),
      ],
      ),
    );
  }
}
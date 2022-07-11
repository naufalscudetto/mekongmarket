import 'package:flutter/material.dart';
import 'package:mekong_market/features/account/widgets/account_button.dart';

class TopButtons extends StatefulWidget{
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButtons> {
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Fish Orders', onTap: (){} ),
            AccountButton(text: 'Turn Seller', onTap: (){} ),
          ],
        ),

        const SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(text: 'Fish Wish Lish', onTap: (){} ),
            AccountButton(text: 'Log Out', onTap: (){} ),
          ],
        )
      ],
      );
  }
}
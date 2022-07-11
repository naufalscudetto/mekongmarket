import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mekong_market/common/widgets/custom_button.dart';
import 'package:mekong_market/common/widgets/custom_textfield.dart';
import 'package:mekong_market/constants/global_variables.dart';
import 'package:mekong_market/constants/utils.dart';
import 'package:mekong_market/features/admin/screens/admin_screen.dart';
import 'package:mekong_market/features/admin/screens/services/admin_services.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreen();
}


class _AddProductScreen extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  String category = 'Luxury';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Luxury',
    'Invertebrae',
    'Crustacean',
    'Predators',
    'Decorative',
  ];

  void sellProduct(){
    if(_addProductFormKey.currentState!.validate() && images.isNotEmpty){
      adminServices.sellProduct(
        context: context, 
        name: productNameController.text, 
        description: descriptionController.text, 
        price: double.parse(priceController.text), 
        quantity: double.parse(quantityController.text), 
        category: category, images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
    appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text('Add A Fish', style: TextStyle(color: Colors.black),),
        ),
    ),

    
    body: SingleChildScrollView(
      child: Form(
        key: _addProductFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              images.isNotEmpty ? CarouselSlider(
              items: images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.file(
                      i,
                      fit: BoxFit.fill,
                      height: 300,
                      width: double.infinity,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 250,
              ),
           ) : GestureDetector(
                onTap: selectImages,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(15),
                  dashPattern: const [10, 4],
                  child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.folder_special, size: 40,),
                      SizedBox(height: 15,),
                      Text(
                        'Upload Fish Image',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),),
              ),

              const SizedBox(height: 25,),
              CustomTextField(controller: productNameController, hintText: 'Fish Name'),

              const SizedBox(height: 25,),
              CustomTextField(controller: descriptionController, hintText: 'Fish Description', maxLines: 5,),

              const SizedBox(height: 25,),
              CustomTextField(controller: priceController, hintText: 'Price of Fish (per Kg)'),

              const SizedBox(height: 25,),
              CustomTextField(controller: quantityController, hintText: 'Amount of Fish'),

              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: category,
                  icon: const Icon(Icons.keyboard_double_arrow_up_outlined),
                  items: productCategories.map((String item) {
                    return DropdownMenuItem(value: item,child: Text(item));
                  }).toList(),
                  onChanged: (String? newVal){
                    setState(() {
                      category = newVal!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 25,),
              CustomButton(text: 'Add Fish', onTap: sellProduct,),

            ],
          ),
        ),
      ),
    ),
    );
  }
}
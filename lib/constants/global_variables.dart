import 'package:flutter/material.dart';

String uri = 'http://10.0.2.2:3000';
class GlobalVariables{

    static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;  

  static const List<String> carouselImages = [
    'https://images.unsplash.com/photo-1485846299386-f367c81034d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1200&q=80',
    'https://media.istockphoto.com/photos/a-fish-stall-owner-holding-fishes-on-both-of-his-hand-looking-at-in-picture-id1179007897?k=20&m=1179007897&s=612x612&w=0&h=QNyywAZI0SPE7wnjajq0SQPnE8wzWbZ7FSNv7OtRUZI=',
    'https://images.unsplash.com/photo-1569001804799-1ff94b1a1a68?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
    'https://images.unsplash.com/photo-1568727349390-7deb45c78797?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Luxury',
      'image': 'assets/images/Luxury.png',
    },
    {
      'title': 'Invertebrae',
      'image': 'assets/images/Invertebrae.png',
    },
    {
      'title': 'Crustacean',
      'image': 'assets/images/Crustacean.png',
    },
    {
      'title': 'Predators',
      'image': 'assets/images/Predators.png',
    },
    {
      'title': 'Decorative',
      'image': 'assets/images/Decorative.png',
    },
  ];

}
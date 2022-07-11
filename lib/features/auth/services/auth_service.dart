import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mekong_market/common/widgets/bottom_bar.dart';
import 'package:mekong_market/constants/error_handling.dart';
import 'package:mekong_market/constants/global_variables.dart';
import 'package:mekong_market/constants/utils.dart';
import 'package:mekong_market/features/home/screens/home_screen.dart';
import 'package:mekong_market/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:mekong_market/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Authservice {

  //sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,    
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password, 
        email: email,
        address: '', 
        type: '', 
        token: '',
        cart: [],
      );
      
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'), 
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context, 
        onSuccess: (){
          showSnackBar(context, 'Account created, Login to Continue',);
        },
      );

    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,  
  }) async {
    try {

      
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'), 
        body: jsonEncode({
          'email': email,
          'password': password,
          }),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context, 
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(context, BottomBar.routeName, (route) => false,);
          showSnackBar(context, 'Successfully Logged In',);
        },
      );

    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // getData
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if(token == null){
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenValid'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        }
      );

      var response = jsonDecode(tokenRes.body);

      if(response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }

    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

}
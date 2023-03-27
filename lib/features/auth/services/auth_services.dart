import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/home/screens/home_screens.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/variables.dart';

class AuthServices {
  void signupuser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(name, '', email, password, '', '', '');
      var link = Uri.parse('$uri/api/signup');
      print(link);
      http.Response res =
          await http.post(link, body: user.toJson(), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account created! Login");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signinuser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var link = Uri.parse('$uri/api/signin');
      http.Response res = await http.post(link,
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            // ignore: use_build_context_synchronously
            Provider.of<Userprovider>(context, listen: false).setuser(res.body);
            await sharedPreferences.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getuserdata(
    BuildContext context,
  ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');

      if (token == null) {
        pref.setString('x-auth-token', ' ');
      }
      var tokenres = await http.post(Uri.parse('$uri/tokenisvalid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(tokenres.body);
      // if response is true we will get the user data through token
      // print('object $response');
      if (response) {
        http.Response userres = await http.get(
          // calling the get method to get user data
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        // ignore: use_build_context_synchronously
        var userprovder = Provider.of<Userprovider>(context, listen: false);
        // print(userres.body);
        userprovder.setuser(userres.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

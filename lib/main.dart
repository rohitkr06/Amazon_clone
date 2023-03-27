// import 'dart:js';

import 'package:amazon_clone/constants/variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:amazon_clone/features/auth/widgets/bottom_bar.dart';
import 'package:amazon_clone/home/screens/home_screens.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //provider is used here
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Userprovider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthServices().getuserdata(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        primarySwatch: Colors.blue,
      ),
      // for routing use this
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<Userprovider>(context).user.token.isEmpty
          ? const AuthScreen()
          : const Bottombar(),
    );
  }
}

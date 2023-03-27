// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:amazon_clone/constants/variables.dart';
import 'package:amazon_clone/features/account/accont_screen.dart';
import 'package:amazon_clone/home/screens/home_screens.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Bottombar extends StatefulWidget {
  static const String routename = '/bottom';
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  List<Widget> list = [
    HomeScreen(),
    Accountscreen(),
    Center(
      child: Text('Cart'),
    )
  ];

  int _page = 0;
  double bottombarwidth = 42;
  double bottombarborderwidth = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (val) {
          setState(() {
            _page = val;
          });
        },
        items: [
          // homepage
          BottomNavigationBarItem(
              icon: Container(
                child: Icon(Icons.home_outlined),
                width: bottombarwidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottombarborderwidth)),
                ),
              ),
              label: ''),
          //account
          BottomNavigationBarItem(
              icon: Container(
                child: Icon(Icons.person_outlined),
                width: bottombarwidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottombarborderwidth)),
                ),
              ),
              label: ''),
          //cart
          BottomNavigationBarItem(
              icon: Container(
                child: Badge(
                    badgeContent: Text('2'),
                    badgeStyle:
                        BadgeStyle(badgeColor: Colors.white, elevation: 1),
                    child: Icon(Icons.shopping_cart_outlined)),
                width: bottombarwidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottombarborderwidth)),
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}

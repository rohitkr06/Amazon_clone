import 'package:amazon_clone/constants/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'name',
                width: 120,
                height: 45,
                color: Colors.black,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

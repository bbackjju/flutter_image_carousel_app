import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [1, 2, 3, 4, 5].map(
          (number) => Image.asset('assets/img/image_$number.jpeg',
          fit: BoxFit.cover,)
          ).toList(),
      ),
    );
  }
}
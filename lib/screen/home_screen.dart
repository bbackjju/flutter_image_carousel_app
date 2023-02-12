import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        int? nextPage = pageController.page?.toInt();

        if(nextPage == null){
          return;
        }

        if(nextPage == 5) {
          nextPage = 0;
        }else {
          nextPage++;
        }
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final List<Image> images = [];

    for(int i=1; i<6; i++){
      images.add(Image.asset('assets/img/image_$i.jpeg'));
    }

    images.add(Image.network('https://cdn.newspenguin.com/news/photo/201912/877_1419_234.jpg'));

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: images,
      ),
    );
  }
}
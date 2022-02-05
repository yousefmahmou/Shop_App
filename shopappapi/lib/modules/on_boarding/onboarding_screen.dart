import 'package:flutter/material.dart';

import 'package:shopappapi/modules/login/shop_login_screen.dart';
import 'package:shopappapi/shared/components/components.dart';
import 'package:shopappapi/shared/network/local/cache_helper.dart';
import 'package:shopappapi/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  String image;
  String title;
  String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
//هنعمل 3اونبورد في الشوب اب
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/image1.gif',
      title: 'On Board 1 Title',
      body: 'On Board 1 body',
    ),
    BoardingModel(
      image: 'assets/images/image2.gif',
      title: 'On Board 2 Title',
      body: 'On Board 2 body',
    ),
    BoardingModel(
      image: 'assets/images/image3.gif',
      title: 'On Board 3 Title',
      body: 'On Board 3 body',
    ),
  ];

  void supmit() {
    Cachehelper.savaData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndfinish(
          context,
          ShopLoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
            function: supmit,
            text: 'Skip',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardinItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(children: [
              SmoothPageIndicator(
                controller: boardController,
                effect: ExpandingDotsEffect(
                  activeDotColor: defaultColor,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5,
                ),
                count: boarding.length,
              ),
            ]),
            Spacer(),
            FloatingActionButton(
              onPressed: () {
                /*if (isLast) {
                  supmit();
                }*/
                if (isLast) {
                  supmit();
                } else {
                  boardController.nextPage(
                    duration: Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                }
              },
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardinItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image(
          //  image: AssetImage('assests/images/onboars1.png'),
          //  ),
          Expanded(
            child: Image.asset(
              model.image,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            model.body,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'on_boarding_logic.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingLogic logic = Get.put(OnBoardingLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<OnBoardingLogic>(
          init: OnBoardingLogic(),
          builder: (GetxController controller) => Container(
            margin: const EdgeInsets.only(top: 50, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //==== Skip Button =============================================
                GestureDetector(
                  onTap: () => Get.offAllNamed(AppRoutes.homeNavBar),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 25,
                      width: 60,
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[50],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("تخطي"),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //==== List Page builder =======================================
                Flexible(
                  child: PageView.builder(
                    controller: logic.pageController,
                    physics: BouncingScrollPhysics(),
                    itemCount: 3,
                    onPageChanged: (int index) => logic.onPageChanged(index),
                    itemBuilder: (context, index) => uiOnBoarding(
                      context: context,
                      image: logic.listBoarding[index].image,
                      title: logic.listBoarding[index].title,
                      body: logic.listBoarding[index].body,
                    ),
                  ),
                ),

                //==== Button next Page  =======================================
                FloatingActionButton(
                  elevation: 0,
                  onPressed: logic.isLastPage == false
                      ? () => logic.functionNextPage()
                      : () => Get.offAllNamed(AppRoutes.homeNavBar),
                  child: logic.isLastPage == false
                      ? Icon(Icons.arrow_forward_ios)
                      : Text("GO"),
                ),

                //==== SmoothPageIndicator  ====================================
                SizedBox(height: 40),
                SmoothPageIndicator(
                    controller: logic.pageController, // PageController
                    count: logic.listBoarding.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.red,
                      dotHeight: 7,
                    ), // your preferred effect
                    onDotClicked: (index) {}),
              ],
            ),
          ),
        ));
  }

  Widget uiOnBoarding({context, String image, title, body}) {
    return Column(
      children: [
        new Container(
          height: 350,
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 20),
        Text(title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(body, style: TextStyle(fontSize: 17), textAlign: TextAlign.center),
      ],
    );
  }
}

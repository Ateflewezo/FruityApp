import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'on_boarding_Model.dart';

class OnBoardingLogic extends GetxController {
  bool isLastPage = false;
  PageController pageController = new PageController();


  // ================== onPageChanged
  void onPageChanged(int index) {
    if (index == listBoarding.length - 1) {
      isLastPage = true;
    } else {
      isLastPage = false;
    }
    update();
  }


  // ================== functionNextPage
  void functionNextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }


  // ================== functionNextPage
  void toHomeApp() {
    Get.toNamed("HomeApp");
  }


  // ================== listBoarding
  List<ModelBoarding> listBoarding = [

    ModelBoarding(
      image: "https://assets.website-files.com/5e446734e5ab9a866ffcdb67/5e44676ff448aa1684ec6158_5d6eb253a1a9c94a6ec4ea45_undraw_work_chat_erdt.png",
      title: "تعرف على شركة فنون المسلم",
      body: "نحن شركة تصميم مواقع إستثنائية يقع مقرنا الرئيسي بالمملكة العربية السعودية بالعاصمة (الرياض)، وتم تأسيس الشركة عام 2007، ومنذ ذلك الحين ونحن نعمل على خلق حلول تصميمة وتسويقية مبتكرة تساعد نشاطك التجاري على النجاح وتحقيق المزيد من المبيعات والربح",
    ),

    ModelBoarding(
      image: "https://images.golinks.io/blog/wp-content/uploads/2021/02/18215023/image-83.png",
      title: "فريق عمل متميز",
      body: "يتمتع فريق عمل شركة (فنون المسلم) بالخبرة والمهنية المطلوبة لتصميم مواقع مبتكرة غنية بالمحتوي تنبض بالجمال وسهلة الاستخدام حيث يصل العملاء إلى المعلومات بسهولة ويسير",
    ),

    ModelBoarding(
      image: "https://static.helpjuice.com/helpjuice_production/uploads/upload/image/4752/direct/1586817239215-New%20Hire%20Orientation.jpg",
      title: "حلول فريدة ومبتكرة",
      body: "أننا في (فنون المسلم) لا نصمم المواقع بطريقة تقليدية، بل تعتمد فلسفتنا على تصميم مواقع تملك فكر مبتكر وحلول غير تقليدية، بحيث يصبح موقعك الأفضل بين جميع المواقع المنافسة له، مما يجعله ينال كامل الرضا من المستخدمين.",
    ),
  ];




}

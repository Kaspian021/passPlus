
import 'package:get/get.dart';
import 'package:passplus/Page_controller/name_page.dart';
import 'package:passplus/controller/binding.dart';
import 'package:passplus/view/addaccount_screen.dart';
import 'package:passplus/view/home/home_screen.dart';
import 'package:passplus/view/splash_screen.dart';

class RoutePage {

  RoutePage._();

  static List<GetPage<dynamic>> names= [

        GetPage(name: NPage.routeSplashScreen, page: () => SplashScreen(),binding: HomeScreenBinding()),
        GetPage(name: NPage.homeScreen, page: () => HomeScreen(),binding: HomeScreenBinding()),
        GetPage(name: NPage.addAccountScreen, page: ()=> AddAccountScreen())

      ];

}
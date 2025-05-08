
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:passplus/controller/binding.dart';
import 'package:passplus/view/addaccount_screen.dart';
import 'package:passplus/view/home_screen.dart';
import 'package:passplus/view/splash_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await initHive();

  
  runApp(Main());

}

Future<void> initHive()async{

  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  
  await Hive.openBox('userData');
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(

        elevatedButtonTheme: ElevatedButtonThemeData(

          style: ButtonStyle(
            animationDuration: Duration(seconds: 5),
            
            textStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.bodyMedium)
            
          )

        )

      ),
      getPages: [

        GetPage(name: NPage.homeScreen, page: () => HomeScreen(),binding: HomeScreenBinding()),
        GetPage(name: NPage.addAccountScreen, page: ()=> AddAccountScreen())

      ],
      
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      home: SplashScreen(),
    );
  }
}

class NPage{

  static const homeScreen= '/HomeScreen';
  static const addAccountScreen= '/AddAccountScreen';

}


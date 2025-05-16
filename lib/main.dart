
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:passplus/Page_controller/name_page.dart';
import 'package:passplus/Page_controller/route_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform
  );
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
      initialRoute: NPage.routeSplashScreen,
      theme: ThemeData(

        elevatedButtonTheme: ElevatedButtonThemeData(

          style: ButtonStyle(
            animationDuration: Duration(seconds: 5),
            
            textStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.bodyMedium)
            
          )

        )

      ),
      getPages: RoutePage.names,
      
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      
    );
  }
}




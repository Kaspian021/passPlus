
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:passplus/controller/authtentcate_controller.dart';
import 'package:passplus/gen/assets.gen.dart';
import 'package:passplus/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final authenticatController = Get.put(AuthentcationController());

  @override
  void initState() {
    
    super.initState();
    checkAuthentication();
    
  }

  checkAuthentication()async{
    

    

      if(await authenticatController.checkLoginUser()){
      if(await authenticatController.isBiometricsEnabeld()){

        authenticatController.authenticate();

      }
    }else{
      
      Future.delayed(Duration(seconds: 5)).then((onValue){
        
        Get.offAndToNamed(NPage.homeScreen);
      });

    }

    

  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(Assets.images.logoApp.path,scale: 2,),
                SpinKitCircle(size: 45,color: Colors.black,)

                
              ],
            ),
        ),
      ),
    );
  }
}
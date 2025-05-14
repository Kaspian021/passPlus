//package_flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:passplus/Animations/animation_home_screen.dart';

//screens_project
import 'package:passplus/Temp/colors_widget.dart';
import 'package:passplus/controller/authtentcate_controller.dart';
import 'package:passplus/controller/listuspass_controller.dart';
import 'package:passplus/gen/assets.gen.dart';
import 'package:passplus/service/serviceinapp.dart';
import 'package:passplus/view/addaccount_screen.dart';
import 'package:passplus/view/home/list_account_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //controller_Getx=>
  final controllerListItem = Get.find<ListuspassController>();
  final controllerAuthentication = Get.find<AuthentcationController>();

  //GlobalKey_Drawer
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  

  checkverify() async {
    var verify = await controllerAuthentication.isBiometricsEnabeld();
    return verify;
  }

  @override
  void initState() {
    //controller_Animation
    AnimationHomeScreen.controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    
    //Animations
    AnimationHomeScreen.animationSlide = Tween<Offset>(
      begin: Offset(1, 1),
      end: Offset(0, 1),
    ).animate(AnimationHomeScreen.controller);
    AnimationHomeScreen.controller.forward();

    AnimationHomeScreen.animationSlide.addListener((){

      if(AnimationHomeScreen.animationSlide.isCompleted){
        AnimationHomeScreen.controller.forward();
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,

        drawer: drawerPlus(),

        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _globalKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu_sharp, color: Colors.white),
          ),
          elevation: 100,

          backgroundColor: Colors.black87,
          title: Row(
            children: [
              Expanded(
                child: Image.asset(Assets.images.logoApp.path, height: 150),
              ),
              SizedBox(width: 20),

              Icon(Icons.notifications_outlined, size: 25, color: Colors.white),
            ],
          ),
        ),
        body: Obx(
          () => Center(
            child: SizedBox(
              height: Get.height,
              width: Get.width,

              child: Stack(
                children: [
                  controllerListItem.listuspass.isNotEmpty
                      ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controllerListItem.listuspass.length,
                        itemBuilder: (context, index) {
                          return ListAnimation(context, index: index);
                        },
                      )
                      : Center(child: Text('Not AccountUser')),

                  //navigationBar
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: Get.height/8.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: ColorsWidget.colorsnavigationBar,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controllerListItem.fileDelete.value = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddAccountScreen(),
                              allowSnapshotting: true,
                            ),
                          );
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(bottom: 50,right: Get.height/8,left: Get.height/8),
                          child: SlideTransition(
                            position: AnimationHomeScreen.animationSlide,
                            child: Container(
                              
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.0,
                                    blurStyle: BlurStyle.normal,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Hero(
                                      tag: 'addText',
                          
                          
                                      child: Text("Add new Account"),
                                    ),
                                    LottieBuilder.asset(
                                      Assets.icons.animationAddaccount,
                                      height: 100,
                                      width: 60,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //icon_setting
                  Positioned(
                    right: Get.width / 1.33,
                    top: Get.height / 1.37,
                    height: 80,

                    child: GestureDetector(
                      onTap: () async {},

                      child:
                          checkverify() == true
                              ? Lottie.asset(
                                Assets.icons.animationSettingNormal,
                                fit: BoxFit.cover,
                              )
                              : Lottie.asset(
                                Assets.icons.animationSettingwarning,
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Drawer drawerPlus() {
    return Drawer(
      backgroundColor: Colors.black,
      width: Get.height / 3,
      child: ListView(
        children: [
          ListTile(title: Image.asset(Assets.images.logoApp.path, height: 200)),

          ListTile(
            title: GestureDetector(
              onTap: () {
                luncherUrlForApp('https://github.com/Kaspian021');
              },
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    textAlign: TextAlign.center,
                    'passplus on GitHup',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  SvgPicture.asset(Assets.icons.githubIcon, fit: BoxFit.cover),
                ],
              ),
            ),
          ),
          Divider(indent: 30, endIndent: 30),
          ListTile(
            title: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Setting',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.settings_suggest_outlined, color: Colors.white),
                ],
              ),
            ),
          ),
          Divider(indent: 30, endIndent: 30),
          ListTile(
            title: GestureDetector(
              onTap: () {
                luncherUrlForApp('https://t.me/KaspianMobail');
              },
              child: Text(
                textAlign: TextAlign.center,
                'Other programs',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          Divider(indent: 30, endIndent: 30),

          SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  luncherUrlForApp('https://t.me/KaspianMobail');
                },
                icon: Icon(Icons.telegram, color: Colors.white, size: 35),
              ),

              IconButton(
                onPressed: () {
                  luncherUrlForApp('https://t.me/KaspianMobail');
                },
                icon: Icon(Icons.discord_sharp, color: Colors.white, size: 35),
              ),
              GestureDetector(
                onTap: () {
                  luncherUrlForApp('https://www.instagram.com/kaspianlive17');
                },
                child: SvgPicture.asset(Assets.icons.instagram, height: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

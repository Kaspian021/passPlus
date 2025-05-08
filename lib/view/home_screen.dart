import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:passplus/Temp/colors_widget.dart';
import 'package:passplus/controller/authtentcate_controller.dart';
import 'package:passplus/controller/listuspass_controller.dart';
import 'package:passplus/gen/assets.gen.dart';
import 'package:passplus/main.dart';
import 'package:passplus/service/serviceinapp.dart';
import 'package:pull_down_button/pull_down_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controllerListItem = Get.find<ListuspassController>();
  final controllerAuthentication = Get.find<AuthentcationController>();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  checkverify() async {
    var verify = await controllerAuthentication.isBiometricsEnabeld();
    return verify;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,

        drawer: Drawer(
          backgroundColor: Colors.black,
          width: Get.height / 3,
          child: ListView(
            children: [
              ListTile(
                title: Image.asset(Assets.images.logoApp.path, height: 200),
              ),

              ListTile(
                title: GestureDetector(
                  onTap: () {
                    luncherUrlForApp('https://github.com/Kaspian021');
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      Text(
                        textAlign: TextAlign.center,
                        'passplus on GitHup',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(width: 12,),
                       SvgPicture.asset(Assets.icons.githubIcon,fit: BoxFit.cover,),
                      
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
                      SizedBox(width: 12,),
                      Icon(Icons.settings_suggest_outlined,color: Colors.white,)
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
                  IconButton(onPressed: () {

                      luncherUrlForApp('https://t.me/KaspianMobail');


                  },icon: Icon(Icons.telegram,color: Colors.white,size: 35,)),
                  
                  IconButton(onPressed: () {

                      luncherUrlForApp('https://t.me/KaspianMobail');


                  },icon: Icon(Icons.discord_sharp,color: Colors.white,size: 35,)),
                  GestureDetector(onTap: () {
                    
                    luncherUrlForApp('https://www.instagram.com/kaspianlive17');

                  },child: SvgPicture.asset(Assets.icons.instagram,height: 30,))
                ],
              ),
              
            ],
          ),
        ),

        appBar: AppBar(
          
          leading: IconButton(
            onPressed: () {
              _globalKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu_sharp,color: Colors.white,),
          ),
          elevation: 100,

          backgroundColor: Colors.black87,
          title: Row(
            children: [
              Expanded(
                child: Image.asset(Assets.images.logoApp.path, height: 150),
              ),
              SizedBox(width: 20),

              Icon(Icons.notifications_outlined, size: 25,color: Colors.white,),
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
                          return itemlist(index, context);
                        },
                      )
                      : Center(child: Text('Not AccountUser')),

                  //navigationBar
                  Positioned(
                    top: Get.height / 1.33,
                    
                    
                    bottom: 0,
                    
                    child: Container(
                      height: Get.height / 10,
                      width: Get.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: ColorsWidget.colorsnavigationBar,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(right: 100,left: 110,bottom: Get.height/20),
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
                            
                            child: GestureDetector(
                              onTap: () {
                                controllerListItem.fileDelete.value=true;
                                Get.toNamed(NPage.addAccountScreen);
                                
                              },
                              
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text("Add Account"), LottieBuilder.asset(Assets.icons.animationAddaccount,height: 100,width: 60,)],
                                ),
                            ),
                          ),
                          ),
                      ),
                      ),
                    
                  ),
                  
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

  Obx itemlist(int index, context) {
    var bodysizeEnd = MediaQuery.of(context).size.height / 6;
    return Obx(
      () => Padding(
        padding: EdgeInsets.fromLTRB(
          30,
          20,
          30,
          index == controllerListItem.listuspass.length - 1 ? bodysizeEnd : 0,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 3.5,
                color: Colors.blueGrey
              ),

            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue,width: 1,style: BorderStyle.solid)
          ),
          child: Column(
            children: [
              
              Row(
                children: [
                  
                  
                  SizedBox(width: 60),
                  Expanded(
                    child: Text(
                      controllerListItem.listuspass[index].name!,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                alignment: Alignment.topRight,
                child: PullDownButton(
                  
                  itemBuilder: (context) => [
                    PullDownMenuItem(
                      title: 'copy',
                      onTap: () {},
                    ),
                    
                    PullDownMenuItem(
                      title: 'delete',
                      itemTheme: PullDownMenuItemTheme(textStyle: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w700)),
                      onTap: () {
                        controllerListItem.deleteItem(index);
                      },
                      icon: CupertinoIcons.delete,
                      iconColor: Colors.red,
                      enabled: true,
                    ),
                  ],
                  buttonBuilder: (context, showMenu) => CupertinoButton(
                    onPressed: showMenu,
                    padding: EdgeInsets.zero,
          
                    child: const Icon(CupertinoIcons.ellipsis_circle,size: 25,color: Colors.red,),
                  ),
                ),
              ),
                ],
              ),
              
              
              Row(
                
                children: [
                  
                  Container(
                    height: 40,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue,width: 2,style: BorderStyle.solid),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10.5
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: controllerListItem.listuspass[index].icon == null
                        ? AssetImage(Assets.images.logoApp.path)
                          
                          
                        : FileImage(File(controllerListItem.listuspass[index].icon!),)
                    ),
                    )
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: Get.width / 1.9,
                    child: Text(
                      controllerListItem.listuspass[index].user!,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
          
              
              SizedBox(
                width: Get.width / 1.85,
                child: Row(
                  children: [
                    
                    Text(
                      controllerListItem.listuspass[index].showPass!.value ==
                              true
                          ? controllerListItem.listuspass[index].password!
                          : "*" *
                              controllerListItem
                                  .listuspass[index]
                                  .password!
                                  .length,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (controllerListItem
                                .listuspass[index]
                                .showPass!
                                .value !=
                            true) {
                          controllerListItem.listuspass[index].showPass!.value =
                              true;
                        } else {
                          controllerListItem.listuspass[index].showPass!.value =
                              false;
                        }
                      },
                      icon:
                          controllerListItem
                                      .listuspass[index]
                                      .showPass!
                                      .value ==
                                  false
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}

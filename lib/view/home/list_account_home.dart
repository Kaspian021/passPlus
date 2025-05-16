
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passplus/Animations/animation_list_home.dart';
import 'package:passplus/controller/listuspass_controller.dart';
import 'package:passplus/gen/assets.gen.dart';
import 'package:passplus/service/serviceinapp.dart';

import 'package:pull_down_button/pull_down_button.dart';

class ListAnimation extends StatefulWidget {
  final int index;
  const ListAnimation(BuildContext context, {super.key, required this.index});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {

      
      


  final controllerListItem = Get.find<ListuspassController>();


  double scale=.8;
  double opacityIconEye=1;
  bool stateclik= false;



  @override
  void initState() {
    AnimationListHome.controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    AnimationListHome.animationIconEye = Tween<double>(begin: 0, end: 1).animate(AnimationListHome.controller);


    AnimationListHome.animationContainer = Tween<double>(begin: 0, end: 10).animate(AnimationListHome.controller);

    AnimationListHome.animationColorWidgetCart = ColorTween(
      begin: Colors.indigo,
      end: Colors.cyan,
    ).animate(AnimationListHome.controller);

    AnimationListHome.animationColorIcon = ColorTween(
      begin: Colors.white,
      end: Colors.red,
    ).animate(AnimationListHome.controller);

    AnimationListHome.controller.repeat();

    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height / 11;
    return Obx(
      () => Padding(
        padding: EdgeInsets.fromLTRB(
          30,
          20,
          30,
          widget.index == controllerListItem.listuspass.length - 1 ? size : 0,
        ),
        child: AnimatedBuilder(animation: CurvedAnimation(parent: AnimationListHome.controller, curve: Curves.fastEaseInToSlowEaseOut), builder: (context, child) {
          
          return Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 3.5, color: AnimationListHome.animationColorWidgetCart.value?? Colors.blueGrey)],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 60),
                  Expanded(
                    child: Text(
                      controllerListItem.listuspass[widget.index].name!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  //menu_bar
                  Align(
                    alignment: Alignment.topRight,
                    child: PullDownButton(
                      position: PullDownMenuPosition.over,
                      
                      itemBuilder:
                          (context) => [
                            PullDownMenuItem(title: 'copy', onTap: () {}),

                            PullDownMenuItem(
                              title: 'delete',
                              itemTheme: PullDownMenuItemTheme(
                                textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onTap: () {
                                controllerListItem.deleteItem(widget.index);
                              },
                              icon: CupertinoIcons.delete,
                              iconColor: Colors.red,
                              enabled: true,
                            ),
                          ],
                      buttonBuilder:
                          (context, showMenu) => CupertinoButton(
                            onPressed: showMenu,
                            padding: EdgeInsets.zero,

                            child: const Icon(
                              CupertinoIcons.ellipsis_circle,
                              size: 25,
                              color: Colors.red,
                            ),
                          ),
                    ),
                  ),
                ],
              ),

              //icon_list
              Row(
                children: [
                  Transform.rotate(
                    angle: AnimationListHome.animationContainer.value,
                    child: Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:AnimationListHome.animationColorIcon.value!,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10.5),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image:
                              !controller.selectIcon.value
                                  ? AssetImage(Assets.images.logoApp.path)
                                  : FileImage(
                                    File(
                                      controllerListItem
                                          .listuspass[widget.index]
                                          .icon!,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ),
                  //user_list
                  SizedBox(width: 10),
                  SizedBox(
                    width: Get.width / 1.9,
                    child: Text(
                      controllerListItem.listuspass[widget.index].user!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              //showPassword
              SizedBox(
                width: Get.width / 1.85,
                child: Row(
                  children: [
                    Text(
                      controllerListItem
                                  .listuspass[widget.index]
                                  .showPass!
                                  .value ==
                              true
                          ? controllerListItem
                              .listuspass[widget.index]
                              .password!
                          : "*" *
                              controllerListItem
                                  .listuspass[widget.index]
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
                                .listuspass[widget.index]
                                .showPass!
                                .value !=
                            true) {
                          controllerListItem
                              .listuspass[widget.index]
                              .showPass!
                              .value = true;
                              scale+=.2;
                              if(stateclik){

                                stateclik=false;
                                
                                

                              }else{

                                stateclik=true;
                                
                              }

                        } else {
                          controllerListItem
                              .listuspass[widget.index]
                              .showPass!
                              .value = false;
                              scale-=.2;
                              if(stateclik){

                                stateclik=false;
                                opacityIconEye=0;
                                

                              }else{

                                stateclik=true;
                                opacityIconEye=1;
                              }
                        }
                      },
                      icon:
                          controllerListItem
                                      .listuspass[widget.index]
                                      .showPass!
                                      .value ==
                                  false
                              ? AnimatedScale(scale: scale,
                              duration: Duration(milliseconds: 100),
                              child: Opacity(opacity: AnimationListHome.animationIconEye.value,
                              child: Icon(Icons.visibility_outlined,color: Colors.black,)))
                              : AnimatedScale(scale: scale,
                              duration: Duration(milliseconds: 100),
                              child: Opacity(opacity:AnimationListHome.animationIconEye.value ,
                              child: Icon(Icons.visibility_off,color: Colors.black,)))
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        },)
      ),
    );
  }
  @override
  void dispose() {
    AnimationListHome.controller.dispose();
    
    super.dispose();
  }

}

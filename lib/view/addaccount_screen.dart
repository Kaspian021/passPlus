import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passplus/controller/listuspass_controller.dart';
import 'package:passplus/service/serviceinapp.dart';

// ignore: must_be_immutable
class AddAccountScreen extends StatelessWidget {
  AddAccountScreen({super.key});

  final controllerUsePass = Get.put(ListuspassController());

  RxBool verifyEmail = false.obs;
  RxBool verifyName = false.obs;
  RxString password = ''.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add new Account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_forward_sharp),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    await filePickerIcon();
                  },
                  child: Column(
                    children: [
                      Container(
                        width: Get.width / 2,
                        height: Get.height / 11.8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.blue,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child:
                              controllerUsePass.file.value.name == 'not' ||
                                      controllerUsePass.fileDelete.value == true
                                  ? Icon(
                                    Icons.image,
                                    color: Colors.blue,
                                    size: 30,
                                  )
                                  : Image.file(
                                    File(controllerUsePass.file.value.path!),
                                    fit: BoxFit.contain,
                                  ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Chenge icon', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      verifyName.value = true;
                    } else {
                      verifyName.value = false;
                    }
                  },

                  controller: controllerUsePass.textNameEditingController,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    hintText: 'https://www.instagram.com',
                    hintStyle: TextStyle(color: Colors.black45, fontSize: 12),
                    labelText: 'name Website',
                    labelStyle: TextStyle(
                      color:
                          verifyName.value == true ? Colors.green : Colors.red,
                    ),
                    icon: Icon(Icons.wordpress_sharp, size: 30),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    if (value.isPhoneNumber || value.isEmail) {
                      verifyEmail.value = true;
                    } else {
                      verifyEmail.value = false;
                    }
                  },

                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  controller: controllerUsePass.textUserNameEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'kaspian@gmail.com',
                    hintStyle: TextStyle(color: Colors.black45, fontSize: 12),
                    labelText: 'Email / Phone Namber',
                    labelStyle: TextStyle(
                      color:
                          verifyEmail.value == true ? Colors.green : Colors.red,
                    ),
                    icon: Icon(Icons.phone_iphone_rounded, size: 30),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    password.value = value;
                  },

                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  controller: controllerUsePass.textPasswordEditingController,
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      gapPadding: BorderSide.strokeAlignCenter,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: '*******',

                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                      decorationColor:
                          password.value.isNotEmpty ? Colors.black : Colors.red,
                    ),
                    labelText: 'Password / Pin',
                    labelStyle: TextStyle(
                      color:
                          password.value.isNotEmpty ? Colors.green : Colors.red,
                    ),

                    icon: Icon(Icons.lock_outlined, size: 30),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (verifyEmail.value == true) {
                      if (verifyName.value == true) {
                        controllerUsePass.addNewItem();
                        Get.snackbar(
                          "Registration is done",
                          "Return to the previous page to see the registered account.",
                          animationDuration: Duration(seconds: 2),
                          icon: Icon(
                            Icons.check_sharp,
                            color: Colors.green,
                            size: 30,
                          ),
                        );
                        password.value = '';
                        verifyEmail.value = false;
                        verifyName.value = false;
                        controllerUsePass.fileDelete.value = true;
                      }
                    }
                  },

                  style: ButtonStyle(
                    animationDuration: Duration(seconds: 2),
                    backgroundColor: WidgetStateProperty.resolveWith((
                      callback,
                    ) {
                      if (callback.contains(WidgetState.pressed)) {
                        return Colors.black;
                      }
                      return verifyEmail.value == false ||
                              verifyName.value == false ||
                              password.value == ''
                          ? Colors.black38
                          : Colors.blue;
                    }),
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

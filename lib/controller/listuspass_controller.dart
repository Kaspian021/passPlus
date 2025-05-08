

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:passplus/model/uspass_model.dart';

class ListuspassController extends GetxController {

  RxBool fileDelete= false.obs;
  RxBool selectIcon= false.obs;

  final box= Hive.box('userData');

  RxList<UspassModel> listuspass = RxList();
  TextEditingController textNameEditingController = TextEditingController();
  TextEditingController textUserNameEditingController = TextEditingController();
  TextEditingController textPasswordEditingController = TextEditingController();
  


  Rx<PlatformFile> file = PlatformFile(name: 'not', size: 0).obs;

  


   Future<void> saveList() async {
    try{
      final saveData = listuspass.map((item) => item.tomap()).toList();
      await box.put('uspasslist', saveData);
      debugPrint('Data saved: ${box.get('uspasslist')}');
      file.value=PlatformFile(name: 'not', size: 0);

    }catch(e){

      debugPrint('error: $e');
    }
      
    
  }

  
  Future<void> loadListUsPass() async {
    try {
      final data = box.get('uspasslist') ?? [];
      
      listuspass.assignAll(
        (data as List).map((item) => UspassModel.fromMap(
          Map<String, dynamic>.from(item) 
        )).toList()
      );
      
    } catch (e) {
      debugPrint('Error loading data: $e');
      listuspass.clear(); 
    }
  }

  
  Future<void> addNewItem() async {
    final newItem = UspassModel(
      user: textUserNameEditingController.text,
      password: textPasswordEditingController.text,
      name: textNameEditingController.text,
      icon: file.value.path, 
      showPass: false.obs,
    );
    textNameEditingController.text='';
    textUserNameEditingController.text='';
    textPasswordEditingController.text='';
    
    
    listuspass.insert(0, newItem);
    update();
    await saveList();
    
    
    
  }

  Future<void> deleteItem(index)async{

    if(index >= 0 && index < listuspass.length){
      listuspass.removeAt(index);

      await saveList();

      update();
    }

  }

  @override
  void onInit() {
    loadListUsPass();
    super.onInit();
  }

}

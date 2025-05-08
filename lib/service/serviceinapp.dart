
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:passplus/controller/listuspass_controller.dart';
import 'package:url_launcher/url_launcher.dart';

var controller = Get.put(ListuspassController());


filePickerIcon()async{

  FilePickerResult? result= await FilePicker.platform.pickFiles(type: FileType.image);

  if(result!=null){
    controller.selectIcon.value=true;
    controller.file.value= result.files.single ;
    controller.fileDelete.value=false;
    
  }else{

    controller.selectIcon.value=false;
  }
  
}

luncherUrlForApp(String url)async{

  try{
    var urlpars= Uri.parse(url);

    

    await launchUrl(urlpars);

    
  }catch(e){
    debugPrint('error: $e');
  }

}
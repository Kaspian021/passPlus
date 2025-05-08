
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passplus/Temp/storage_key.dart';

class AuthentcationController extends GetxController {

  final  _storage = GetStorage();
  final LocalAuthentication _authentication =LocalAuthentication();

  Future<bool>checkLoginUser()async{

    return (await _storage.read(StorageKey.userName))=='true';

  }


  Future<bool>isBiometricsEnabeld()async{

    return (await _storage.read(StorageKey.isBiometric))=='true';

  }
  
  Future<void> enabeldBiometrics()async{

    return (await _storage.write(StorageKey.isBiometric ,'true'));

  }
  
  Future<void> disabeldBiometrics()async{

    return (await _storage.remove(StorageKey.isBiometric));

  }


  Future<bool> authenticate()async{

    try{

      return await _authentication.authenticate(

        localizedReason: 'Please scan your fingerprint',
        options: AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true

        )

      );

    } catch(e){

      debugPrint('خطا به این شکل است : $e');
      return false;

    }

  }






}
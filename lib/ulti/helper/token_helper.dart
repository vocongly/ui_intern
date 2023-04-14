import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ui_intern/ulti/helper/secure_storage_helper.dart';

import '../../data/config/models/token.dart';
import '../constant/secure_storage_key.dart';

class TokenHelper{
  static Future<bool> checkToken() async{
    String? accessToken = await SecureStorageHelper.read(SecureStorageKey.accessToken);
    if(accessToken !=null && !isInDate(accessToken)){
      return true;
    }
    return false;
  }

  static Future<String?> getAccessToken() async{
    return await SecureStorageHelper.read(SecureStorageKey.accessToken);
  }

  static Future<void> saveToken({required Token token}) async{
    await SecureStorageHelper.save(SecureStorageKey.accessToken, token.token);
  } 

  static Future<void> removeToken() async{
    await SecureStorageHelper.delete(SecureStorageKey.accessToken);
  }

  static bool isInDate(String token){
    return JwtDecoder.isExpired(token);
  }
}
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../consts/env.dart';
import 'package:dio/dio.dart';

import '../utils/apiService.dart';

class UserAuthentication extends GetxController {

RxString? token = RxString("");
RxString? saveToken;
String errorMessage = '';



Future<bool?> loginUser({required String username, required String password}) async {
  // var url = "$baseUrl/auth/login-to-account";

  var url ="https://upload-pic-backend.vercel.app/api/v1/auth/login-to-account";
  
  errorMessage='';
  try {
    final data = {
      "username": username,
      "password": password
    };

    Dio dio = Dio();
    var response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode!<= 202) {
      saveToken = RxString(response.data['token'] as String); // Initialize RxString with the value
      token = saveToken; // Assign saveToken to token
      print(response.data['token']);
      saveAuthData(token!); 
      update();// Assuming saveAuthData expects RxString?
      return true;
    }
    return false;
  } catch (e) {
    // ignore: deprecated_member_use
    if (e is DioError) {
      // Extract error message from response
      print('Error $e');
      // String error = e.response?.data[];
      // errorMessage = error;
      // print('Error Message : $errorMessage');
      return false;
    } else {
      // Handle other types of errors
      print('Error: $e');
      return false;
    }
  }
}



Future<bool?> registerNewUser({
    required String name, 
    required String username,
    required String password,
})async{
  var url = "$baseUrl/auth/create-new-account";

  try {
  Map<String,dynamic> data = {
      "name":name,
      "username":username,
      "password":password
    };

    print('Data : $data');

    Dio dio = Dio();
    var response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode!<= 202) {
      print(response.data);
      return true;
    }
    return false;
  } catch (e) {
    // ignore: deprecated_member_use
    if (e is DioError) {
      // Extract error message from response
      var errorMessage = e.response;
      print( errorMessage);
      return false;
    } else {
      // Handle other types of errors
      print('Error: $e');
      return false;
    }
  }

}


// save token here

Future<bool?> saveAuthData(RxString? token) async {
  try {
    final prefs = await SharedPreferences.getInstance(); 
    await prefs.setString('bank', token!.string);
    print('saved token :${prefs.get('bank')}');
    return true;
  } catch (e) {
    print('Failed save token : $e');
    return false;
  }
}


// load token here

Future<bool> loadAuthData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString('bank');

    if (savedToken != null) {
      token = RxString(savedToken);
      print('Loaded auth token: $token');
      return true;
    } else {
      print('No token found in SharedPreferences');
      return false;
    }
  } catch (e) {
    print('Failed to load token: $e');
    return false;
  }
}


 Future<bool> userLogout(String token)async{

  var url = "$baseUrl/auth/logout";
  var params;
    try{
      ApiResponse apiResponse = await ApiService().get(url, token, params);
      if(apiResponse.statusCode <= 202){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e.toString());
      return false;
    }
  }

// clear token here

Future<void> clearAuthData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('bank');
  } catch (e) {
    print('Failed to clear token: $e');
  }
}

}
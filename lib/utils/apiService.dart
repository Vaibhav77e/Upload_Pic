import 'dart:convert';

import 'package:dio/dio.dart';

import '../consts/consts_flag.dart';
import '../widgets/toasts.dart';

class ApiResponse<T> {
  late int statusCode;
  late dynamic data;
  late String? error;

  ApiResponse({
    required this.statusCode,
    required this.data,
    this.error,
  });
}


class ApiService {
  Future<ApiResponse> post(url, token, data) async {

    var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
        };

    if(token==null) {
      headers = {
        'Content-Type': 'application/json',
      };
    }
    
    ApiResponse result = ApiResponse(
        statusCode: NO_NETWORK,
        data: null,
        error: null
    );

    var encodedData = json.encode(data);

    var dio = Dio();
    

    try{
      var response = await dio.request(
        url,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: encodedData,
      );

      if (response.statusCode == 200 || (response.statusCode! > 200 && response.statusCode! < 210)) {
        print(json.encode(response.data));
        result.statusCode = response.statusCode!;
        result.data = response.data;
        return result;
      } else {
        print(response.statusMessage);
        result.statusCode = response.statusCode!;
        result.error = "response.error";
        return result;
      }

    } on DioException catch (e) {
      print(e);
    if (e.response != null && e.response!.statusCode == 400) {
      print('HTTP Status Code 400 (Bad Request) Error:');
      print('Response Data: ${e.response?.data}');
      Toasts.showFailureToast(e.response?.data["message"]);
      print('Response Data: ${e.response?.data}');
      result.statusCode = e.response!.statusCode!;
      result.error = "response.data";
      return result;
      // TODO
    } else {
      Toasts.showFailureToast("${e.response?.data['message']}");
      print('Dio Error: $e');
      result.statusCode = e.response!.statusCode!;
      result.error = "response.data";
      print("Error Response : ${e.response?.data}");
      return result;
    }
  }

  }

  Future<ApiResponse> postFormData(url, token, FormData data) async {
    var headers = {
      'authorization': token
    };

    ApiResponse result = ApiResponse(
        statusCode: NO_NETWORK,
        data: null,
        error: null
    );

    var encodedData = data;

    var dio = Dio();


    try{
      var response = await dio.request(
        url,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: encodedData,
      );

      if (response.statusCode == 200 || (response.statusCode! > 200 && response.statusCode! < 210)) {
        //print(json.encode(response.data));
        result.statusCode = response.statusCode!;
        result.data = response.data;
        return result;
      } else {
        print(response.statusMessage);
        result.statusCode = response.statusCode!;
        result.error = "response.data";
        return result;
      }

    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        print('HTTP Status Code 400 (Bad Request) Error:');
        print('Response Data: ${e.response?.data}');
        // TODO
      } else {
        print('Dio Error: $e');
        print('Response Data: ${e.response?.data}');
      }
    }

    return result;
  }

  Future<ApiResponse> get(url, token, params)  async {
    var headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token'
    };

    if(token==null) {
      headers = {
        'Content-Type': 'application/json',
      };
    }

    ApiResponse result = ApiResponse(
        statusCode: NO_NETWORK,
        data: null,
        error: null
    );

    var dio = Dio();


    try{
      var response = await dio.request(
        url,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: params
      );

      if (response.statusCode == 200 || (response.statusCode! > 200 && response.statusCode! < 210)) {
        // print(json.encode(response.data));
        result.statusCode = response.statusCode!;
        result.data = response.data;
        return result;
      } else {
        print(response.statusMessage);
        result.statusCode = response.statusCode!;
        result.error = "response.data";
        return result;
      }

    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode! >= 400 || e.response != null && e.response!.statusCode! <= 404) {
        print('HTTP Status Code 400 (Bad Request) Error:');
        print('Response Data: ${e.response?.data}');
        // TODO
      } else {
        print('Dio Error: $e');
      }
    }
    return result;
  }



  Future<ApiResponse> delete(url,token,data) async {
  var headers = {
    'Content-Type': 'application/json',
    'authorization': token,
  };

  if (token == null) {
    headers = {
      'Content-Type': 'application/json',
    };
  }

  ApiResponse result = ApiResponse(
    statusCode: NO_NETWORK,
    data: null,
    error: null,
  );

  var dio = Dio();
  var encodedData = json.encode(data);

  try {
    var response = await dio.delete(
      url,
      options: Options(
        method: 'DELETE',
        headers: headers,
      ),
        data: encodedData,

    );

    if (response.statusCode == 200 ||
        (response.statusCode! > 200 && response.statusCode! < 210)) {
      print(json.encode(response.data));
      result.statusCode = response.statusCode!;
      result.data = response.data;
      return result;
    } else {
      print(response.statusMessage);
      result.statusCode = response.statusCode!;
      result.error = "response.error";
      return result;
    }
  } on DioError catch (e) {
    print(e);
    if (e.response != null && e.response!.statusCode == 400) {
      print('HTTP Status Code 400 (Bad Request) Error:');
      print('Response Data: ${e.response?.data}');
      Toasts.showFailureToast(e.response?.data["message"]);
      print('Response Data: ${e.response?.data}');
      result.statusCode = e.response!.statusCode!;
      result.error = "response.data";
      return result;
      // TODO
    } else {
      Toasts.showFailureToast("Check your network and try again!");
      print('Dio Error: $e');
      result.statusCode = e.response!.statusCode!;
      result.error = "response.data";
      return result;
    }
  }

  return result;
}

}
import 'package:dio/dio.dart';
import 'package:flutter_core_eis/constants/shared_pref_keys.dart';
import 'package:flutter_core_eis/services/api_endpoints/api_endpoints.dart';
import 'package:flutter_core_eis/services/dio_errors/dio_errors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  ApiServices._() {
    dioOptions();
  }

  static final ApiServices apiServices = ApiServices._();
  static Dio dio = Dio();

  dioOptions() {
    dio
      ..options.baseUrl = APIEndpoints.baseUrl
      ..options.connectTimeout = APIEndpoints.connectionTimeout
      ..options.receiveTimeout = APIEndpoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'accept': 'application/json'
      }
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          // on request interceptor - useful for adding headers
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var token = prefs.getString(SharedPrefKeys.access_token);
            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => token);
              options.headers.addAll({"authorization": "Bearer $token"});
            }
            return handler.next(options);
          },
          // on response interceptor - intercept the response received
          onResponse: (response, handler) {
            return handler.next(response);
          },
          // on error interceptor - intercept the error received
          onError: (DioError e, handler) {
            if (e.response != null) {
              if (e.response!.statusCode == 401 ||
                  e.response!.statusCode == 403) {
                var errorMessage = DioErrorUtil.handleError(e);
                print(errorMessage);
                // signOut();
              } else {
                var errorMessage = DioErrorUtil.handleError(e);
                print(errorMessage);
              }
              return handler.next(e);
            } else {
              return;
            }
          },
        ),
      );
  }

  //////////////////////////////////////////////////////
  ///////////////// CALLER FUNCTIONS ///////////////////
  //////////////////////////////////////////////////////

  ////////////////////////
  // GET REQUEST CALLER //
  ////////////////////////
  provideGetRequest(String url,
      {required Map<String, dynamic> queryParameters}) async {
    try {
      return await dio.get(url);
    } on DioError catch (e) {
      return e.response;
    }
  }

  /////////////////////////
  // POST REQUEST CALLER //
  /////////////////////////
  Future providePostRequest(String url, dynamic data) async {
    try {
      return await dio.post(
        url,
        data: data,
      );
    } on DioError catch (e) {
      throw e.error;
    }
  }

  ////////////////////////
  // PUT REQUEST CALLER //
  ////////////////////////
  Future providePutRequest(String url, dynamic data) async {
    try {
      await dio.put(
        url,
        data: data,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future providePatchRequest(String url, dynamic data) async {
    try {
      return await dio.patch(
        url,
        data: data,
      );
    } on DioError catch (e) {
      throw e.error;
    }
  }

  ///////////////////////////////////
  // POST FORM DATA REQUEST CALLER //
  ///////////////////////////////////
  Future providePostRequestFormData(String url, dynamic data) async {
    var errorMessage;
    print("Api****" + url);
    print("data****" + data.toString());
    Response res =
        await dio.post(url, data: FormData.fromMap(data)).catchError((error) {
      errorMessage = DioErrorUtil.handleError(error);
      print("ERROR in API RES : " + errorMessage);
      throw error;
    });

    return res.data;
  }

  ///////////////////////////
  // DELETE REQUEST CALLER //
  ///////////////////////////
  Future provideDeleteRequest(String url, dynamic data) async {
    try {
      await dio.delete(
        url,
        data: data,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
    } on DioError catch (e) {
      return e.response;
    }
  }
}

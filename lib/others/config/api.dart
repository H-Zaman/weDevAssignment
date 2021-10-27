import 'package:dio/dio.dart';
import 'package:wedevassignment/app/data/api_response_model.dart';
import 'package:wedevassignment/others/config/api_routes.dart';
import 'package:wedevassignment/others/helper/logger.dart';
import 'package:wedevassignment/others/util/env.dart';


class Api{

  Api._();

  static final _dio = Dio();

  static int _connectTimeout = 60000;
  static int _receiveTimeout = 60000;

  static BaseOptions _options = new BaseOptions(
      baseUrl: Env.apiLink,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout
  );

  static Map<String, dynamic> _headers = {
    'Accept' : 'application/json'
  };

  static Dio _baseClient(bool authRequired){
    // final UserController userController = Get.Get.find();
    // if(authRequired){
    //   _headers.putIfAbsent(HttpHeaders.authorizationHeader, () => '${Env.authHeader} ${userController.authToken}');
    // }

    _dio.options = _options..headers = _headers;

    return _dio;
  }

  static AResponse _processData(Response _apiResponse){

    return AResponse(
      error: false,
      message: _apiResponse.data.containsKey('message') ? _apiResponse.data['message'] : 'None',
      data: _apiResponse.data
    );

/*    /// checking status code
    /// making sure it request was a success
    if(_apiResponse.statusCode == 200){

      /// checking if api response has the necessary data
      /// if not something might have gone wrong and
      /// the data is corrupted
      if(_apiResponse.data.containsKey('error') && _apiResponse.data.containsKey('message')){

        final Map<String, dynamic> _data = _apiResponse.data;

        /// checking if api returned any error
        if(_data['error']){
          Snack.showError(message: _data['message']);
          return AResponse(
              error: true,
              message: _data['message']
          );
        }else{
          /// if there is a token the data is set to the token
          if(_data.containsKey('token')){
            return AResponse(
                error: false,
                message: _data['message'],
                data: _data['token']
            );
          }else{
            return AResponse(
                error: false,
                message: _data['message'],
                data: _data['data']
            );
          }
        }

      }else{
        return AResponse(
            error: true,
            message: 'Corrupted Data'
        );
      }

    }else{
      return AResponse(
          error: true,
          message: 'Api Status Code ${_apiResponse.statusCode}'
      );
    }*/
  }

  static String _processErrorMessage(dynamic error){

    String errorMsg = 'Body Error: ';

    if(error is DioError){
      if(error.type == DioErrorType.connectTimeout){
        errorMsg += 'Request timed out';
      } else if(error.response!.statusCode! >= 300){
        try{
          errorMsg += error.response!.data['errors'].map((error) => error['msg']).toString();
        }catch(e){
          try{
            errorMsg += error.response!.data['errors']['msg'];
          }catch(e){
            errorMsg += error.response!.toString();
          }
        }

        errorMsg += '\nStatus Message: ' + error.response!.statusMessage!;
      }

      return errorMsg;
    }


    return error.toString();
  }

  static Future<AResponse> get(
      String route,
      {
        Map<String, dynamic>? queryParams
      }
      )async{
    try{

      /// adding the authorization token base to requirements
      final _client = _baseClient(ApiRoutes.isAuthRequired(route));

      /// logging route and data
      logger.i('GET $route', queryParams);

      final _apiResponse = await _client.get(
          route,
          queryParameters: queryParams
      );

      /// logging result
      logger.i(_apiResponse.data);

      return _processData(_apiResponse);


    }catch(e){
      final error = _processErrorMessage(e);
      logger.e(e.toString(), '**********$route FAILED**********\n$error');
      return AResponse(
          error: true,
          message: error
      );
    }
  }

  static Future<AResponse> post(
      String route,
      {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic>? data,
      })async{
    try{

      /// adding the authorization token base to requirements
      final _client = _baseClient(ApiRoutes.isAuthRequired(route));

      /// logging route and data
      logger.i('POST $route', queryParams ?? data);

      final _apiResponse = await _client.post(
          route,
          queryParameters: queryParams,
          data: data
      );

      /// logging result
      logger.i(_apiResponse.data);

      return _processData(_apiResponse);


    }catch(e){
      final error = _processErrorMessage(e);
      logger.e(e.toString(), '**********$route FAILED**********\n$error');
      return AResponse(
          error: true,
          message: error
      );
    }
  }

  static Future<AResponse> put(
      String route,
      {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic>? data,
      })async{
    try{

      /// adding the authorization token base to requirements
      final _client = _baseClient(ApiRoutes.isAuthRequired(route));

      /// logging route and data
      logger.i('PUT $route', queryParams ?? data);

      final _apiResponse = await _client.put(
          route,
          queryParameters: queryParams,
          data: data
      );

      /// logging result
      logger.i(_apiResponse.data);

      return _processData(_apiResponse);


    }catch(e){
      final error = _processErrorMessage(e);
      logger.e(e.toString(), '**********$route FAILED**********\n$error');
      return AResponse(
          error: true,
          message: error
      );
    }
  }

  static Future<AResponse> delete(
      String route,
      {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic>? data,
      })async{
    try{

      /// adding the authorization token base to requirements
      final _client = _baseClient(ApiRoutes.isAuthRequired(route));

      /// logging route and data
      logger.i('DELETE $route', queryParams ?? data);

      final _apiResponse = await _client.delete(
          route,
          queryParameters: queryParams,
          data: data
      );

      /// logging result
      logger.i(_apiResponse.data);

      return _processData(_apiResponse);


    }catch(e){
      final error = _processErrorMessage(e);
      logger.e(e.toString(), '**********$route FAILED**********\n$error');
      return AResponse(
          error: true,
          message: error
      );
    }
  }
}
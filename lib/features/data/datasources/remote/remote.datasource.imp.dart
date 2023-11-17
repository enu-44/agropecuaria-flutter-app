// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';


import 'package:agropecuariosapp/features/core/utils/api_response.dart';
import 'package:agropecuariosapp/features/core/utils/auth.utils.dart';
import 'package:agropecuariosapp/features/core/utils/failure.dart';
import 'package:agropecuariosapp/features/data/datasources/remote/remote.datasource.dart';
import 'package:agropecuariosapp/features/domain/entities/task/request/task.request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/task/task.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/user/authentication.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/user/request/user.entity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/result_response.dart';


class RemoteDatasourceImpl implements RemoteDataSource{

  final String baseUrl = 'http://192.168.20.66:8001/api';

  //SIGN UP OF API
  @override
  Future<Result<ApiResponse<bool>, Failure>> signUpUser(UserEntity user) async {
    try {
      final body = {
        "username": user.username,
        "email": user.email,
        "password": user.password
      };
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signUp'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final apiResponse = ApiResponse<bool>(
        data: responseData['data'],
        message: responseData['msg'],
        code: responseData['code'],
        success: responseData['success'],
      );
      return Result.ok(apiResponse);        
      } else {
        final responseData = jsonDecode(response.body);
        final message = responseData['msg'];
        final code = response.statusCode;
        return Result.error(Failure(message,code));
      }
    } catch (e) {
        return Result.error(Failure('Error en la solicitud: $e', 500));
    }
  }

  @override
  Future<Result<ApiResponse<AuthEntity>, Failure>> signInUser(UserEntity user) async {
    try {
      final body = {
        "email": user.email,
        "password": user.password
      };
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signIn'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(response);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final data = responseData['data'];
        final apiResponse = ApiResponse<AuthEntity>(
          data: AuthEntity(accessToken: data['accessToken'], refreshToken: data['refreshToken']),
          message: responseData['msg'],
          code: responseData['code'],
          success: responseData['success'],
        );
        return Result.ok(apiResponse);        
      } else {
        final responseData = jsonDecode(response.body);
        final message = responseData['msg'];
        final code = response.statusCode;
        return Result.error(Failure(message,code));
      }
    } catch (e) {
        return Result.error(Failure('Error en la solicitud: $e', 500));
    }
  }

  @override
  Future<String> getCurrentUid() async {
    final prefs = await SharedPreferences.getInstance();
     final accessToken = prefs.getString(AuthUtils.accessTokenKey)!;
    if (accessToken != null) {
      final parts = accessToken.split('.');
      if (parts.length == 3) {
        final payload = parts[1];
        final decoded = base64Url.decode(payload);
        final payloadMap = json.decode(utf8.decode(decoded));
        final userId = payloadMap['id'];
        
        if (userId != null) {
          return userId.toString();
        }
      }
    }
    return 'Usuario no encontrado';
  }

  @override
  Future<bool> isSignIn() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('isLogin') ?? false; // El valor predeterminado es false si no se encuentra la clave.
    return isLogin;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<ApiResponse<bool>, Failure>> add(TaskRequestEntity params) async {

    try {
      final token = await AuthUtils.getAccessToken();
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      };

      final body = {
        "title": params.title,
        "description": params.description,
        "expiration": params.expiration,
        "status": params.status
      };

      final response = await http.post(
        Uri.parse('$baseUrl/services/task/add'),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final apiResponse = ApiResponse<bool>(
          data: responseData['data'],
          message: responseData['msg'],
          code: responseData['code'],
          success: responseData['success'],
        );
        return Result.ok(apiResponse);        
      } else {
        final responseData = jsonDecode(response.body);
        final message = responseData['msg'];
        final code = response.statusCode;
        return Result.error(Failure(message,code));
      }
    } catch (e) {
      return Result.error(Failure('Error en la solicitud: $e', 500));
    }    
  }

  @override
  Future<Result<ApiResponse<List<TaskEntity>>, Failure>> list() async {
    try {
      final token = await AuthUtils.getAccessToken();
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      };



      final response = await http.post(
        Uri.parse('$baseUrl/services/task/list'),
        headers: headers,
      );
      if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final data = responseData['data'];
          final List<TaskEntity> tasks = List<TaskEntity>.from(data.map((taskData) {
          return TaskEntity(
            id: taskData['id'].toString(),
            title: taskData['title'],
            description: taskData['description'],
            expiration: taskData['expiration'],
            status: taskData['status'],
          );
        }));
        
        final apiResponse = ApiResponse<List<TaskEntity>>(
          data: tasks,
          message: responseData['msg'],
          code: responseData['code'],
          success: responseData['success'],
        );
      
      return Result.ok(apiResponse);      
      } else {
        final responseData = jsonDecode(response.body);
        final message = responseData['msg'];
        final code = response.statusCode;
        return Result.error(Failure(message,code));
      }
    } catch (e) {
      return Result.error(Failure('Error en la solicitud: $e', 500));
    }    
  }

  @override
  Future<Result<ApiResponse<bool>, Failure>> edit(TaskRequestEntity params) async {
      try {
      final token = await AuthUtils.getAccessToken();
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      };

      final body = {
        "id": int.parse(params.id!),
        "title": params.title,
        "description": params.description,
        "expiration": params.expiration,
        "status": params.status
      };

      final response = await http.post(
        Uri.parse('$baseUrl/services/task/edit'),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final apiResponse = ApiResponse<bool>(
          data: responseData['data'],
          message: responseData['msg'],
          code: responseData['code'],
          success: responseData['success'],
        );
        return Result.ok(apiResponse);        
      } else {
        final responseData = jsonDecode(response.body);
        final message = responseData['msg'];
        final code = response.statusCode;
        return Result.error(Failure(message,code));
      }
    } catch (e) {
      return Result.error(Failure('Error en la solicitud: $e', 500));
    }    
  }

  @override
  Future<Result<ApiResponse<bool>, Failure>> delete(int param) async {
    try {
      final token = await AuthUtils.getAccessToken();
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': '$token',
      };

      final body = {
        "id": param,
      };

      final response = await http.post(
        Uri.parse('$baseUrl/services/task/delete'),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final apiResponse = ApiResponse<bool>(
          data: responseData['data'],
          message: responseData['msg'],
          code: responseData['code'],
          success: responseData['success'],
        );
        return Result.ok(apiResponse);        
      } else {
        final responseData = jsonDecode(response.body);
        final message = responseData['msg'];
        final code = response.statusCode;
        return Result.error(Failure(message,code));
      }
    } catch (e) {
      return Result.error(Failure('Error en la solicitud: $e', 500));
    }  
  }

}
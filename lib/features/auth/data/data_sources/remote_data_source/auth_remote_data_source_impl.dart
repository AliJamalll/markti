import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/api/end_point.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/core/failures/failures.dart';
import 'package:markti/features/auth/data/models/active_reset_password_response_Dm.dart';
import 'package:markti/features/auth/data/models/login_response_Dm.dart';
import 'package:markti/features/auth/data/models/new_paasword_response_Dm.dart';
import 'package:markti/features/auth/data/models/register_response_DM.dart';
import 'package:markti/features/auth/data/models/send_password_email_DM.dart';
import 'package:markti/features/auth/domain/entities/active_reset_password_response_entity.dart';
import 'package:markti/features/auth/domain/entities/login_response_entity.dart';
import 'package:markti/features/auth/domain/entities/new_password_response_entity.dart';
import 'package:markti/features/auth/domain/entities/register_repspons_intity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:markti/features/auth/domain/entities/send_password_email_entity.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../domain/repositories/data_source/remote_data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, RegisterResponseDm>> register(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.register,
          data: {
            "name": name,
            "email": email,
            "phone": phone,
            "password": password,
            "confirmPassword": confirmPassword,
          },
        );

        var registerResponse = RegisterResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 || response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(
            ServerFailure(
              message: registerResponse.message,
              statusCode: response.statusCode.toString(),
            ),
          );
        }
      } else {
        return Left(
          ServerFailure(
            message: "please check your internet",
            statusCode: "no internet connection",
          ),
        );
      }
    } on DioException catch (dioException) {
      return Left(
        ServerFailure(
          message: dioException.response?.data['message'] ?? "unknown error",
          statusCode:
              dioException.response?.statusCode.toString() ?? "unknown error",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, LoginResponseDm>> login(
    String email,
    String password,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.login,
          data: {"email": email, "password": password},
        );
        var loginResponse = LoginResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 || response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(
            ServerFailure(
              message: loginResponse.message,
              statusCode: response.statusCode.toString(),
            ),
          );
        }
      } else {
        return Left(
          ServerFailure(
            message: "please check your internet",
            statusCode: "no internet connection",
          ),
        );
      }
    } on DioException catch (dioException) {
      return Left(
        ServerFailure(
          message: dioException.response?.data['message'] ?? "unknown error",
          statusCode:
              dioException.response?.statusCode.toString() ?? "unknown error",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SendPasswordEmailDm>> sendResetPassword(
    String email,
  ) async{
    try {
      final List<ConnectivityResult> connectivityResult = await  Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)){
        var response = await apiManager.postData(endPoint: EndPoints.sendResetPassword, data: {"email": email});
        var sendPasswordEmail = SendPasswordEmailDm.fromJson(response.data);
        if(response.statusCode!>=200 || response.statusCode! <300){
          return Right(sendPasswordEmail);
        } else {
          return Left(
            ServerFailure(
              message: sendPasswordEmail.message,
              statusCode: response.statusCode.toString(),
            ),
          );
        }
      } else {
        return Left(
          ServerFailure(
            message: "please check your internet",
            statusCode: "no internet connection",
          ),
        );
      }

    } on DioException catch (dioException) {
      return Left(
        ServerFailure(
          message: dioException.response?.data['message'] ?? "unknown error",
          statusCode:
          dioException.response?.statusCode.toString() ?? "unknown error",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ActiveResetPasswordResponseDm>> activeResetPassword(String email, String code, String message) async{
    try{
      final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(endPoint: EndPoints.activeResetPassword,data: {
          "email": email,
          "code": code,
          "message": message,
        });
        var activeResetPassword= ActiveResetPasswordResponseDm.fromJson(response.data);
        if(response.statusCode! >= 200 || response.statusCode! < 300){
          return Right(activeResetPassword);
        } else {
          return Left(
            ServerFailure(
              message: activeResetPassword.message,
              statusCode: response.statusCode.toString(),
            ),
          );
        }
      }else {
        return Left(
          ServerFailure(
            message: "please check your internet",
            statusCode: "no internet connection",
          ),
        );
      }
      }on DioException catch (dioException) {
      return Left(
        ServerFailure(
          message: dioException.response?.data['message'] ?? "unknown error",
          statusCode:
          dioException.response?.statusCode.toString() ?? "unknown error",
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
          statusCode: "unknown error",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NewPaaswordResponseDm>> newPasswordEntity(String email, String password, String confirmPassword)async {
   try{
     final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
     if(connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)){
       var response = await apiManager.postData(endPoint: EndPoints.newPassword);
       var newPasswordResponse = NewPaaswordResponseDm.fromJson(response.data);
       if(response! .statusCode! >= 200 || response.statusCode! < 300){
         return Right(newPasswordResponse);
       } else {
         return Left(
           ServerFailure(
             message: newPasswordResponse.message,
             statusCode: response.statusCode.toString(),
           ),
         );
       }
     }else{
       return Left(
         ServerFailure(
           message: "please check your internet",
           statusCode: "no internet connection",
         ),
       );
     }
   }on DioException catch (dioException){
     return Left(
       ServerFailure(
         message: dioException.response?.data['message'] ?? "unknown error",
         statusCode:
         dioException.response?.statusCode.toString() ?? "unknown error",
       ),
     );
   }
  }
}

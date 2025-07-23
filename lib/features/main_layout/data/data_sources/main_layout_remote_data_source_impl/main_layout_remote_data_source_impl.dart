import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/api/api_manager.dart';
import 'package:markti/core/api/end_point.dart';
import 'package:markti/core/cache/secure_storage.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/main_layout/data/models/main_layout_response_DM.dart';
import 'package:markti/features/main_layout/domain/entities/main_layout_response_entity.dart';
import 'package:markti/features/main_layout/domain/repositories/data_source/main_layout_remote_data_source/main_layout_remote_data_source.dart';

import '../../../../../core/failures/server_failure.dart';
@Injectable(as: MainLayoutRemoteDateSource)
class MainLayoutRemoteDataSourceImpl implements MainLayoutRemoteDateSource{
  ApiManager apiManager;
  MainLayoutRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, MainLayoutResponseDm>> getAllProducts() async{
   try{
     final List<ConnectivityResult> connectivityResult =await  Connectivity().checkConnectivity();
     if(connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)){
       final token = await secureStorage.read(key: "token");
       var response = await apiManager.getData(endPoint: EndPoints.getAllProducts,
       headers: {
          "Authorization" : "Bearer $token",
       });
       var productResponse = MainLayoutResponseDm.fromJson(response.data);

       if(response.statusCode! >=200 && response.statusCode! < 300){
         return Right(productResponse);
       }else{
          return Left(ServerFailure(
            statusCode: response.statusCode.toString(),
          ));
       }
     }else{
       ///no internet connection
       return Left(ServerFailure(
         message: "Please check your internet connection",
         statusCode: "No Internet Connection",
       ));
     }
   }on DioException catch(dioException){
     return Left(
       ServerFailure(
         message: dioException.response?.data["message"] ?? "Unknown error",
         statusCode: dioException.response?.statusCode.toString() ?? "Unknown error",
       ),
     );
   }catch (e) {
     print("❌ General Error: $e");
     return Left(
       ServerFailure(
         message: e.toString(),
         statusCode: "unknown error",
       ),
     );
   }
  }
}
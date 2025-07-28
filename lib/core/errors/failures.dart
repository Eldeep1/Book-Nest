import 'package:dio/dio.dart';

abstract class Failure{
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException){
    switch(dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timed out with server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timed out with server");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Received timed out with server");

      case DioExceptionType.badCertificate:
        return ServerFailure("Check your phone date and time then try again");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure("Request To Server Was Cancelled");

      case DioExceptionType.connectionError:
        return ServerFailure("Please Check Your Connection And Try Again");

      case DioExceptionType.unknown:
        return ServerFailure("UnExpected Error Occurred!");
    }
  }
  
  factory ServerFailure.fromResponse(int statusCode, dynamic response){
    if(statusCode==400||statusCode==401||statusCode==403){
      return ServerFailure(response['message']);
    }
    else if (statusCode==404){
      return ServerFailure("The Server Is Under Maintenance, Try Again Later");
    }
    else if (statusCode==500){
      return ServerFailure("Internal Server Error, Try Again Later");
    }
    return ServerFailure("UnExpected Error Occurred!");
  }
}
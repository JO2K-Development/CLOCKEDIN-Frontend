import 'package:flutter_app/core/utils/result.dart';

class NotImplementedFutureResult  {
  static Future<Result<T>> raise<T>(){
    return Future.value(Result.error(Exception("Not implemented"))) as Future<Result<T>>;
  } 
}
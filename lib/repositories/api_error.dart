import 'package:flutter/foundation.dart';

class ApiError {

  ApiError({@required this.code, this.message});

  final int code;
  final String message;
}

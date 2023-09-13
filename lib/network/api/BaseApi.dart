import 'dart:io';

import 'package:custom_bloc_state_management/network/NetConfig.dart';
import 'package:custom_bloc_state_management/network/NetResponses.dart';
import 'package:custom_bloc_state_management/network/exception/TokenException.dart';
import 'package:http/http.dart';

/**
 * Base class for api implementations.
 */
class BaseApi {
  const BaseApi();

  /**
   * Security Basic Authorization
   */
  Map<String, String> get headers {
    return {
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: "Basic ${Credentials.BAH_PASS}"
    };
  }

  Map<String, String> getSecureHeaders(String token) => {
        "Accept": "application/json",
        "${HttpHeaders.authorizationHeader}": "Bearer $token"
      };

  Map<String, String> get parameters => {"client": "firebase"};

  bool isNotAuthorized(Response resp) =>
      resp.statusCode == NetResponses.UNAUTHORIZED;

  bool isSuccessful(Response resp) => resp.statusCode == NetResponses.SUCCESS;

  Exception getNetErrorException(String url) => HttpException(url);

  void throwUnauthorized() {
    throw TokenException();
  }

  HttpException getHttpError(String url) =>
      HttpException(NetResponses.NET_ERROR.toString(), uri: Uri.parse(url));

  void throwError(String url) {
    throw getHttpError(url);
  }

  /**
   * For testing purposes
   */
  void forceDelay(int secs) async {
    await Future.delayed(Duration(seconds: secs));
  }

  void throwNetError(String url) {
    throw getNetErrorException(url);
  }
}

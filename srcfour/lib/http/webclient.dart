import 'package:bytebank/http/interceptors/logging-interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 5),
);
const String baseUrl = 'http://192.168.99.0:8080/transactions';

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}

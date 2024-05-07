// ----------------------------------------------------------------------------------
// Author : Corneille Bankole
// GitHub : https://github.com/Corneille9
// ----------------------------------------------------------------------------------

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../common/utils.dart';

/// A class for making HTTP requests to a specified base URL.
class HttpClient {
  /// The base URL for the HTTP client.
  final String baseUrl;

  final bool useHttps;

  /// Constructs an instance of [HttpClient] with the given [baseUrl].
  HttpClient(this.baseUrl, {this.useHttps = true});

  /// Performs a GET request to the specified [endpoint].
  ///
  /// Optionally accepts [headers] and [queryParameters].
  Future<CustomResponse> get(String endpoint, {Map<String, String>? headers, Map<String, dynamic>? queryParameters}) async {
    var uri = useHttps ? Uri.https(baseUrl, endpoint, queryParameters) : Uri.http(baseUrl, endpoint, queryParameters);
    final response = await http.get(uri, headers: headers);
    return _handleResponse(response);
  }

  /// Performs a POST request to the specified [endpoint].
  ///
  /// [data] is the payload for the POST request. Optionally accepts [headers] and [queryParameters].
  Future<CustomResponse> post(String endpoint, dynamic data, {Map<String, String>? headers, Map<String, dynamic>? queryParameters}) async {
    var uri = useHttps ? Uri.https(baseUrl, endpoint, queryParameters) : Uri.http(baseUrl, endpoint, queryParameters);
    final response = await http.post(uri, headers: headers, body: jsonEncode(data));
    return _handleResponse(response);
  }

  /// Performs a PUT request to the specified [endpoint].
  ///
  /// [data] is the payload for the PUT request. Optionally accepts [headers] and [queryParameters].
  Future<CustomResponse> put(String endpoint, dynamic data, {Map<String, String>? headers, Map<String, dynamic>? queryParameters}) async {
    var uri = useHttps ? Uri.https(baseUrl, endpoint, queryParameters) : Uri.http(baseUrl, endpoint, queryParameters);
    final response = await http.put(uri, headers: headers, body: jsonEncode(data));
    return _handleResponse(response);
  }

  /// Performs a DELETE request to the specified [endpoint].
  ///
  /// Optionally accepts [headers] and [queryParameters].
  Future<CustomResponse> delete(String endpoint, {Map<String, String>? headers, Map<String, dynamic>? queryParameters}) async {
    var uri = useHttps ? Uri.https(baseUrl, endpoint, queryParameters) : Uri.http(baseUrl, endpoint, queryParameters);
    final response = await http.delete(uri, headers: headers);
    return _handleResponse(response);
  }

  /// Handles the HTTP response and returns a [CustomResponse] object.
  CustomResponse _handleResponse(http.Response response) {
    final int statusCode = response.statusCode;
    final String responseBody = response.body;

    if (statusCode < 200 || statusCode >= 400) {
      logger(message: 'Request failed with status: $statusCode and body: $responseBody', error: responseBody);
    }

    return CustomResponse(json.decode(responseBody), statusCode);
  }
}

/// A custom response object representing an HTTP response.
class CustomResponse {
  /// The data received in the response.
  final dynamic data;

  /// The status code of the response.
  final int statusCode;

  /// Constructs a [CustomResponse] with the given [data] and [statusCode].
  CustomResponse(this.data, this.statusCode);

  /// Checks if the response is a failure (status code < 200 or >= 400).
  bool get isFailed => statusCode < 200 || statusCode >= 400;

  /// Checks if the response is a success (status code >= 200 and < 400).
  bool get isSuccess => !isFailed;

  @override
  String toString() {
    return 'CustomResponse{data: $data, statusCode: $statusCode, isFailed: $isFailed, isSuccess: $isSuccess}';
  }
}

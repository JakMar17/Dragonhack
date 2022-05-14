import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../server/routes.dart';
import '../util/either.dart';
import '../util/failures/backend_failure.dart';
import 'http_service.dart';

class BackendService {
  static BackendService? _instance;
  static BackendService get instance => _instance!;

  const BackendService._({required HttpService httpService})
      : _http = httpService;

  factory BackendService({required HttpService httpService}) {
    if (_instance != null) {
      throw StateError('BackendService already created');
    }

    _instance = BackendService._(httpService: httpService);
    return _instance!;
  }

  final HttpService _http;
/* 
  Future<Either<BackendFailure, List<VecturaRide>>> getRides() async {
    final http.Response? response = await _http.get(
      [
        EPServerRoute.api,
        EPServerRoute.apiUser,
        EPServerRoute.apiUserRides,
      ],
      headers: <String, String>{
        HttpHeaders.authorizationHeader: authHeaderValue(),
        HttpHeaders.contentTypeHeader: ContentType.json.value,
      },
    );
    if (response == null) return error(const UnknownBackendFailure());

    switch (response.statusCode) {
      case HttpStatus.ok:
        final List<dynamic> rides = jsonDecode(response.body)["rides"];

        List<VecturaRide> vecturaRides = [];

        for (Map<String, dynamic> ride in rides) {
          vecturaRides.add(VecturaRide.fromJson(ride));
        }

        return value(vecturaRides);
      case HttpStatus.unauthorized:
        return error(const UnauthorizedBackendFailure());
      default:
        return error(BackendFailure.fromStatusCode(response.statusCode));
    }
  } */

}

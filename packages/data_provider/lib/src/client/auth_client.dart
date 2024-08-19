import 'package:data_provider/data_provider.dart';

/// Auth client
class AuthClient {
  final Http _http;
  final TokenStorage _tokenStorage;

  AuthClient({
    required Http httpClient,
    required TokenStorage tokenStorage,
  })  : _http = httpClient,
        _tokenStorage = tokenStorage;

  /// Log In endpoints using phone
  Future<AuthResponse> auth(AuthRequestBody body) async {
    final response = await _http.post<JsonType>(
      '/auth',
      data: body.toJson(),
    );
    late final authResponse;
    if (response.statusCode == 200) {
      authResponse = AuthResponse.fromJson(response.data!);
    } else
      throw (Exception(response.data?['message']));
    if (authResponse != null) {
      final token = authResponse.token;
      if (token != null) {
        await _tokenStorage.saveToken(token);
      }
    }
    return authResponse;
  }

  Future<void> sendOtp({
    required AuthRequestBody body,
  }) async {
    await _http.get<JsonType>(
      '/auth/sendOtp',
      data: body.toJson(),
    );
  }

  Future<dynamic> checkOtp({
    required AuthRequestBody body,
  }) async {
    final response = await _http.post<JsonType>(
      'auth/checkOtp',
      data: body.toJson(),
    );
    if (response.statusCode == 200) {
      return;
    }
  }

  ///Log out
  Future<void> logOut({String? deviceToken}) async {
    await _tokenStorage.clearToken();
  }
}

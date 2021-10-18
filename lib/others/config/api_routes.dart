class ApiRoutes{
  /// POST -> {
  ///     "username": "john",
  ///     "email": "john@doe.com",
  ///     "password": "demo"
  /// }
  static const String AUTH_REGISTER = '/wp/v2/users/register';

  /// POST -> {
  ///     "username": "john",
  ///     "password": "demo"
  /// }
  static const String AUTH_LOGIN = '/jwt-auth/v1/token';

  static const String USER_PROFILE = '/jwt-auth/v1/token';
}
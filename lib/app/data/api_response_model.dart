class AResponse{
  final bool error;
  final String message;
  final String? token;
  final dynamic data;

  AResponse({
    required this.error,
    required this.message,
    this.data,
    this.token
});
}
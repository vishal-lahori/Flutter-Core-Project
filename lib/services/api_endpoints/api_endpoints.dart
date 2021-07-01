class APIEndpoints {
  APIEndpoints._();

  // base url
  static const String baseUrl =
      // "https://jsonplaceholder.typicode.com/todos/1"; // base url
      "https://hova.azurewebsites.net/";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 5 * 60 * 1000; // 5 Minutes

  // auth
  static const String loginUser = baseUrl + 'api/auth/login';
  static const String signUpUser = baseUrl + 'signup';
}

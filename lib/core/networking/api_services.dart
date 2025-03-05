abstract class ApiServices {
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParmetars,
  });

}

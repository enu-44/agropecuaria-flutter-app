
import 'api_response.dart';

class BaseResponse<T> {
  final ApiResponse<T> apiResponse;

  BaseResponse(this.apiResponse);
}
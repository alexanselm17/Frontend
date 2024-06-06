import './remoterepository.dart';
import '../models/user.dart';

class Auth {
  final _apiService = ApiService();

  Future login() async {
    try {
      const endpoint = 'Hello';
      final response = await _apiService.postReq(endpoint);
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

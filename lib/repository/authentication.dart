import './remoterepository.dart';

class Auth {
  final _apiService = ApiService();

  Future login({required String email, required String password}) async {
    try {
      const endpoint = '/login';
      var body = {
        "email": email,
        "password": password,
      };
      final response =
          await _apiService.postReq(endpoint, body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer'
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future logOUt({required String token}) async {
    try {
      const endpoint = '/logout';

      final response = await _apiService.postReq(endpoint, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future getUser({required int userId}) async {
    try {
      var endpoint = '/user/$userId';

      final response = await _apiService.getReq(endpoint, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer'
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future register({
    required String email,
    required String password,
    required String businessAddress,
    required String businessName,
    required String businessRegistrationNumber,
    required String gender,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String url,
  }) async {
    try {
      const endpoint = '/register';
      var body = {
        "email": email,
        "password": password,
        "business_address": businessAddress,
        "business_name": businessName,
        "business_registration_number": businessRegistrationNumber,
        "gender": gender,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "url": url,
      };
      final response =
          await _apiService.postReq(endpoint, body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer'
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future vefiyBusiness({
    required String businessPermit,
    required String kraPin,
    required String natinalId,
    required int userId,
  }) async {
    try {
      var endpoint = '/business/$userId';
      var body = {
        "business": {
          "business_permit": businessPermit,
          "kra_pin": kraPin,
          "national_id": natinalId
        }
      };
      final response =
          await _apiService.postReq(endpoint, body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer'
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

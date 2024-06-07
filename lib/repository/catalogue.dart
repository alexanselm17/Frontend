import './remoterepository.dart';

class CatalogueRepository {
  final _apiService = ApiService();

  Future getProducts() async {
    try {
      const endpoint = '/product';
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

  Future addProducts(
      {required String url,
      required String name,
      required String price,
      required String discount,
      required String itemCode,
      required int storeId,
      required int quantity}) async {
    try {
      const endpoint = '/product';
      var body = {
        "url": url,
        "name": name,
        "price": price,
        "discount": discount,
        "item_code": itemCode,
        "quantity": quantity,
        "store_id": storeId,
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

  Future editProducts(
      {required id,
      required String url,
      required String name,
      required String price,
      required String discount,
      required String itemCode,
      required int storeId,
      required int quantity}) async {
    try {
      var endpoint = "/product/$id";
      var body = {
        "url": url,
        "name": name,
        "price": price,
        "discount": discount,
        "item_code": itemCode,
        "quantity": quantity,
        "store_id": storeId,
      };
      final response = await _apiService.putReq(endpoint, body: body, headers: {
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

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop0koa_frontend/models/catalogue/catalogue.dart';
import 'package:shop0koa_frontend/repository/catalogue.dart';
import 'package:shop0koa_frontend/view/widgets/common.dart';

class CatalogueProvider with ChangeNotifier {
  final CatalogueRepository catalogueRepository = CatalogueRepository();

  CatalogueModel? _catalogue;
  bool _isLoading = false;
  bool _addingProduct = false;

  CatalogueModel? get catalogue => _catalogue;
  bool get isLoading => _isLoading;
  bool get isAddingProduct => _addingProduct;

  TextEditingController urlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController storeIdController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  Future getProducts() async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await catalogueRepository.getProducts();
      _catalogue = CatalogueModel.fromJson(response);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future createProducts({required int storeId, required String url}) async {
    try {
      _addingProduct = true;
      notifyListeners();
      var response = await catalogueRepository.addProducts(
          url: url,
          name: nameController.text,
          price: priceController.text,
          discount: discountController.text,
          itemCode: itemCodeController.text,
          storeId: storeId,
          quantity: int.parse(quantityController.text));
      CommonUtils.showToast('Product Added successfully');
      nameController.clear();
      priceController.clear();
      quantityController.clear();
      discountController.clear();
      urlController.clear();
      itemCodeController.clear();
    } catch (e) {
      _addingProduct = false;
      rethrow;
    } finally {
      _addingProduct = false;
      notifyListeners();
    }
  }

  Future editProducts(
      {required int storeId, required int id, required String url}) async {
    try {
      _addingProduct = true;
      notifyListeners();
      await catalogueRepository.editProducts(
          id: id,
          url: url,
          name: nameController.text,
          price: priceController.text,
          discount: discountController.text,
          itemCode: itemCodeController.text,
          storeId: storeId,
          quantity: int.parse(quantityController.text));
      CommonUtils.showToast('Product Added successfully');
      urlController.clear();
      nameController.clear();
      priceController.clear();
      quantityController.clear();
      discountController.clear();
      urlController.clear();
      itemCodeController.clear();
    } catch (e) {
      _addingProduct = false;
      rethrow;
    } finally {
      _addingProduct = false;
      notifyListeners();
    }
  }
}

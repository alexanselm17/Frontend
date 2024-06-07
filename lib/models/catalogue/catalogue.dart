import 'package:shop0koa_frontend/models/user/user_model.dart';

class CatalogueModel {
  List<Products>? products;

  CatalogueModel({this.products});

  CatalogueModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  double? discount;
  int? id;
  String? itemCode;
  String? name;
  double? price;
  int? quantity;
  Store? store;
  List<Tags>? tags;
  String? url;

  Products(
      {this.discount,
      this.id,
      this.itemCode,
      this.name,
      this.price,
      this.quantity,
      this.store,
      this.tags,
      this.url});

  Products.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    id = json['id'];
    itemCode = json['item_code'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['discount'] = discount;
    data['id'] = id;
    data['item_code'] = itemCode;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['url'] = url;
    return data;
  }
}

class Store {
  int? id;
  String? name;

  Store({this.id, this.name});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

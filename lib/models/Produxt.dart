class Product {
  final bool isAnalytics;
  final String productName;
  final String leftUnits;
  final String productPrice;
  final String productImage;
  final String productDiscount;

  const Product({
    required this.productName,
    required this.leftUnits,
    required this.productPrice,
    required this.productImage,
    required this.productDiscount,
    required this.isAnalytics,
  });

  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return Product(productName: productName, leftUnits: leftUnits, productPrice: productPrice, productImage: productImage, productDiscount: productDiscount, isAnalytics: isAnalytics)
  // }
}

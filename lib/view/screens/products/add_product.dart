import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/models/catalogue/catalogue.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/provider/catalogueProvider.dart';
import 'package:shop0koa_frontend/services/firebase.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  final bool isEdit;
  final Products? product;
  static const routeName = 'AddProduct';
  const AddProduct({super.key, required this.isEdit, this.product});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _imagePicker = ImagePicker();
  final Firebase firebase = Firebase();
  OverlayEntry? _overlayEntry;
  String url = '';

  @override
  void initState() {
    final catalogueProvider =
        Provider.of<CatalogueProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.isEdit
          ? setState(() {
              catalogueProvider.nameController.text = widget.product!.name!;
              catalogueProvider.priceController.text =
                  widget.product!.price.toString();
              catalogueProvider.quantityController.text =
                  widget.product!.quantity.toString();
              catalogueProvider.itemCodeController.text =
                  widget.product!.itemCode!;
              catalogueProvider.discountController.text =
                  widget.product!.discount.toString();
            })
          : null;
    });
    super.initState();
  }

  void _showOverlay(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height / 4,
        left: MediaQuery.of(context).size.width / 10,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () async {
                    final pickedFile = await _imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (pickedFile != null) {
                      var image = await firebase.storeProduct(
                          selectedImageFile: pickedFile);

                      setState(() {
                        url = image;
                      });
                      _overlayEntry?.remove();
                    }
                    _overlayEntry?.remove();
                  },
                  child: const Text('Pick from Gallery'),
                ),
                TextButton(
                  onPressed: () async {
                    final pickedFile = await _imagePicker.pickImage(
                        source: ImageSource.camera);
                    if (pickedFile != null) {
                      var image = await firebase.storeProduct(
                          selectedImageFile: pickedFile);
                      setState(() {
                        url = image;
                      });
                      _overlayEntry?.remove();
                    }
                    _overlayEntry?.remove();
                  },
                  child: const Text('Capture using Camera'),
                ),
                TextButton(
                  onPressed: () {
                    _overlayEntry?.remove();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final catalogueProvider =
        Provider.of<CatalogueProvider>(context, listen: true);
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DottedBorder(
                color: Colors.grey,
                strokeWidth: 2,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  child: TextButton(
                    onPressed: () {
                      _showOverlay(context);
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 80,
                        ),
                        Text('Add product image (JPEG, PNG)'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: catalogueProvider.nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: 'Product Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: catalogueProvider.priceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: 'Price(Ksh)',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                // controller: catalogueProvider.ca,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: 'Category*',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: catalogueProvider.quantityController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: 'Quantity*',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: catalogueProvider.discountController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: 'Discount',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: catalogueProvider.itemCodeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: 'Item Code',
                ),
              ),
              const SizedBox(height: 30),
              catalogueProvider.isAddingProduct
                  ? const Center(child: CircularProgressIndicator())
                  : !widget.isEdit
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: CustomButton(
                            onTap: () async {
                              await catalogueProvider.createProducts(
                                  storeId: 1, url: url);
                            },
                            text: 'ADD PRODUCT',
                          ))
                      : SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          child: CustomButton(
                            onTap: () async {
                              await catalogueProvider.editProducts(
                                storeId: widget.product!.store!.id!,
                                id: widget.product!.id!,
                                url: url,
                              );
                            },
                            text: 'Edit PRODUCT',
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

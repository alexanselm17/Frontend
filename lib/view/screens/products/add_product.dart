import 'package:flutter/material.dart';
import '../../widgets/dotted_border_container.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/models/catalogue/catalogue.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/provider/catalogueProvider.dart';
import 'package:shop0koa_frontend/services/firebase.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProduct extends StatefulWidget {
  final bool isEdit;
  final Products? product;
  static const routeName = 'AddProduct';
  const AddProduct({super.key, required this.isEdit, this.product});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _imagePicker = ImagePicker();
  final Firebase firebase = Firebase();
  String url = '';
  XFile? _selectedImage;

  @override
  void initState() {
    final catalogueProvider =
        Provider.of<CatalogueProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isEdit) {
        setState(() {
          catalogueProvider.nameController.text = widget.product!.name!;
          catalogueProvider.priceController.text =
              widget.product!.price.toString();
          catalogueProvider.quantityController.text =
              widget.product!.quantity.toString();
          catalogueProvider.itemCodeController.text = widget.product!.itemCode!;
          catalogueProvider.discountController.text =
              widget.product!.discount.toString();
        });
      }
    });
    super.initState();
  }

  void _showOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () async {
                  final pickedFile =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    var image = await firebase.storeProduct(
                        selectedImageFile: pickedFile);

                    setState(() {
                      url = image;
                      _selectedImage = pickedFile;
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text('Pick from Gallery'),
              ),
              TextButton(
                onPressed: () async {
                  final pickedFile =
                      await _imagePicker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    var image = await firebase.storeProduct(
                        selectedImageFile: pickedFile);
                    setState(() {
                      url = image;
                      _selectedImage = pickedFile;
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text('Capture using Camera'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final catalogueProvider =
        Provider.of<CatalogueProvider>(context, listen: true);
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? 'Edit Product' : 'Add Product',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DottedBorderContainer(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  child: TextButton(
                    onPressed: () {
                      _showOverlay(context);
                    },
                    child: _selectedImage == null
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 80,
                              ),
                              Text('Add product image (JPEG, PNG)'),
                            ],
                          )
                        : Image.file(
                            File(_selectedImage!.path),
                            fit: BoxFit.cover,
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
                                storeId: auth.user!.store!.id!,
                                url: url,
                              );
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

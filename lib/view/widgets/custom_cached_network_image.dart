import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
        height: 100,
        width: 100.0,
        child: Center(
          child: CircularProgressIndicator(value: downloadProgress.progress),
        ),
      ),
      errorWidget: (context, url, error) => const SizedBox(
          height: 80.0, width: 80, child: Center(child: Icon(Icons.error))),
    );
  }
}

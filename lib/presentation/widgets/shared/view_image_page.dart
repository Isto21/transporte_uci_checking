import 'dart:io';
import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum ExtendedImageType { Network, Asset, File }

class ViewImagePage extends StatelessWidget {
  const ViewImagePage(
      {super.key,
      required this.imagePath,
      required this.heroTag,
      this.extendedImageType = ExtendedImageType.Network});

  final String imagePath;
  final String heroTag;
  final ExtendedImageType extendedImageType;

  @override
  Widget build(BuildContext context) {
    ExtendedImage extendedImage;
    switch (extendedImageType) {
      case ExtendedImageType.Network:
        extendedImage = ExtendedImage.network(
          imagePath,
          mode: ExtendedImageMode.gesture,
          enableSlideOutPage: true,
        );
        break;
      case ExtendedImageType.Asset:
        extendedImage = ExtendedImage.asset(
          imagePath,
          mode: ExtendedImageMode.gesture,
          enableSlideOutPage: true,
        );
        break;
      case ExtendedImageType.File:
        extendedImage = ExtendedImage.file(
          File(imagePath),
          mode: ExtendedImageMode.gesture,
          enableSlideOutPage: true,
        );
        break;
    }

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Hero(
            tag: heroTag,
            child: ExtendedImageSlidePage(
                slideAxis: SlideAxis.vertical,
                slideType: SlideType.onlyImage,
                slidePageBackgroundHandler: (offset, size) {
                  return defaultSlidePageBackgroundHandler(
                      offset: offset,
                      pageSize: size,
                      color: Colors.black,
                      pageGestureAxis: SlideAxis.vertical);
                },
                child: extendedImage),
          ),
        ),
        Positioned(
            right: 10,
            top: 10,
            child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.close_outlined, color: Colors.white)))
      ],
    );
  }

  Color defaultSlidePageBackgroundHandler(
      {required Offset offset,
      required Size pageSize,
      required Color color,
      required SlideAxis pageGestureAxis}) {
    double opacity = 0.0;
    if (pageGestureAxis == SlideAxis.both) {
      opacity = offset.distance /
          (Offset(pageSize.width, pageSize.height).distance / 2.0);
    } else if (pageGestureAxis == SlideAxis.horizontal) {
      opacity = offset.dx.abs() / (pageSize.width / 2.0);
    } else if (pageGestureAxis == SlideAxis.vertical) {
      opacity = offset.dy.abs() / (pageSize.height / 2.0);
    }
    return color.withOpacity(min(1.0, max(1.0 - opacity, 0.0)));
  }

  double? defaultSlideScaleHandler(
      {required Offset offset,
      required Size pageSize,
      required SlideAxis pageGestureAxis}) {
    double scale = 0.0;
    if (pageGestureAxis == SlideAxis.both) {
      scale =
          offset.distance / Offset(pageSize.width, pageSize.height).distance;
    } else if (pageGestureAxis == SlideAxis.horizontal) {
      scale = offset.dx.abs() / (pageSize.width / 2.0);
    } else if (pageGestureAxis == SlideAxis.vertical) {
      scale = offset.dy.abs() / (pageSize.height / 2.0);
    }
    return max(1.0 - scale, 0.8);
  }
}

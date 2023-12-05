import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';
// ignore: depend_on_referenced_packages
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class ZoomImage extends StatelessWidget {
  ZoomImage({super.key, required this.url});
  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: url,
            progressIndicatorBuilder: (context, url, _) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.white,
              ),
              child:
                  LoadingAnimationWidget.inkDrop(color: Colors.grey, size: 100
                      // leftDotColor: const Color(0xFF1A1A3F),
                      // rightDotColor: const Color(0xFFEA3799),
                      ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.white,
              ),
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.grey,
                size: 50,
              ),
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}

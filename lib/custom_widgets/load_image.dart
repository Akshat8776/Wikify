import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'fullimage.dart';

class LoadImage extends StatelessWidget {
  final String url;

  const LoadImage({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ZoomImage(
                      url: url,
                    )));
      },
      child: CachedNetworkImage(
        imageUrl: url,
        progressIndicatorBuilder: (context, url, _) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
          width: 70,
          height: 70,
          child: Center(
            child: LoadingAnimationWidget.inkDrop(
              color: Colors.grey,
              // leftDotColor: const Color(0xFF1A1A3F),
              // rightDotColor: const Color(0xFFEA3799),
              size: 50,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
          width: 70,
          height: 70,
          child: Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.grey,
              size: 40,
            ),
          ),
        ),
        height: 70,
        width: 70,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

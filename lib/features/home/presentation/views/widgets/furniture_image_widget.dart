import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class FurnitureImageWidget extends StatelessWidget {
  const FurnitureImageWidget({
    super.key,
    required this.imageUrl,
    this.aspectRatio,
  });

  final String imageUrl;
  final double? aspectRatio; // Default aspect ratio
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        SizeConfig.width(context, 0.0465),
      ), //20
      child: AspectRatio(
        aspectRatio: aspectRatio ?? 4 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget:
              (context, url, error) =>
                  const Icon(CupertinoIcons.exclamationmark),
        ),
      ),
    );
  }
}

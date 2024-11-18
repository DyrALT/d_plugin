import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_plugin/d_plugin.dart';
import 'package:flutter/widgets.dart';

/// The code defines a class called `CachedImage` which extends `StatelessWidget`. The class has several
/// properties including `imageUrl`, `fit`, `height`, `width`, `placeholder`, and `errorWidget`. These
/// properties are used to configure the `CachedNetworkImage` widget.
@immutable
final class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.imageUrl,
    this.alignment = Alignment.center,
    super.key,
    this.placeholder,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
  });

  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    if (!imageUrl.isUrl) {
      return SizedBox(
        height: height,
        width: width,
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: placeholder,
      errorWidget: errorWidget,
      fit: fit,
      height: height,
      width: width,
      alignment: alignment,
    );
  }
}

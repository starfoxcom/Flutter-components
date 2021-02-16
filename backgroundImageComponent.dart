import 'package:flutter/material.dart';

/// Class component for a background image.
class BackgroundImageComponent extends StatelessWidget {
  /// The background image of this component.
  final ImageProvider image;

  /// The begin offset alignment of this component, for linear gradient.
  final AlignmentGeometry beginAlignment;

  /// The end offset alignment of this component, for linear gradient.
  final AlignmentGeometry endAlignment;

  /// The begin offset color alignment of this component, for linear gradient.
  final Color beginColor;

  /// The end offset color alignment of this component, for linear gradient.
  final Color endColor;

  /// The blend mode of this component, for linear gradient.
  final BlendMode gradientBlendMode;

  /// The box fit for the image of this component.
  final BoxFit imageFit;

  /// The image color filter of this component.
  final Color imageColorFilter;

  /// The image blend mode of this component.
  final BlendMode blendModeImage;

  const BackgroundImageComponent({
    Key key,
    @required this.image,
    this.beginAlignment = Alignment.bottomCenter,
    this.endAlignment = Alignment.bottomCenter,
    this.beginColor = Colors.black,
    this.endColor = Colors.transparent,
    this.gradientBlendMode = BlendMode.darken,
    this.imageFit = BoxFit.cover,
    this.imageColorFilter = Colors.transparent,
    this.blendModeImage = BlendMode.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: beginAlignment,
        end: endAlignment,
        colors: [beginColor, endColor],
      ).createShader(rect),
      blendMode: gradientBlendMode,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: imageFit,
            colorFilter: ColorFilter.mode(
              imageColorFilter,
              blendModeImage,
            ),
          ),
        ),
      ),
    );
  }
}

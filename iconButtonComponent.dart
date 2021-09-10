import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Class component for a icon button
///
/// This component class depends of the following package:
///
/// * `font_awesome_flutter`
///
/// consider adding it to your dependencies on the `pubspec.yaml`
/// file of the project.
class IconButtonComponent extends StatelessWidget {
  /// The left padding of this component.
  final double leftPadding;

  /// The top padding of this component.
  final double topPadding;

  /// The right padding of this component.
  final double rightPadding;

  /// The bottom padding of this component.
  final double bottomPadding;

  /// The symmetric vertical padding of this component.
  ///
  /// This has priority over the [topPadding] and [bottomPadding] values.
  final double? verticalPadding;

  /// The symmetric horizontal padding of this component.
  ///
  /// This has proprity over the [leftPadding] and [rightPadding] values.
  final double? horizontalPadding;

  /// The [onTap] callback function of this component.
  final void Function() onTapCallback;

  /// the height of this component.
  final double height;

  /// The width of this component.
  final double width;

  /// The shape of this component.
  final BoxShape boxShape;

  /// The border radius (circular) of this component.
  final double borderRadius;

  /// The background color of this component.
  final Color backgroundColor;

  /// The border color of this component.
  final Color borderColor;

  /// The border width of this component.
  final double borderWidth;

  /// The icon of this component.
  final IconData icon;

  /// The icon color of this component.
  final Color iconColor;

  /// The icon size of this component.
  final double iconSize;

  const IconButtonComponent({
    Key? key,
    this.leftPadding = 0,
    this.topPadding = 0,
    this.rightPadding = 0,
    this.bottomPadding = 0,
    this.verticalPadding,
    this.horizontalPadding,
    required this.onTapCallback,
    this.height = 30,
    this.width = 30,
    this.boxShape = BoxShape.rectangle,
    this.borderRadius = 0,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 1,
    this.icon = FontAwesomeIcons.icons,
    this.iconColor = Colors.black,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding ?? leftPadding,
        top: verticalPadding ?? topPadding,
        right: horizontalPadding ?? rightPadding,
        bottom: verticalPadding ?? bottomPadding,
      ),
      child: GestureDetector(
        onTap: onTapCallback,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              shape: boxShape,
              borderRadius: (boxShape == BoxShape.rectangle)
                  ? BorderRadius.circular(borderRadius)
                  : null,
              color: backgroundColor,
              border: Border.all(color: borderColor, width: borderWidth)),
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}

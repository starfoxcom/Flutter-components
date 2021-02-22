import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Class component for a flat design action button.
///
/// This component class depends of `font_awesome_flutter.dart`, consider adding
///  it to your dependencies on the `pubspec.yaml` file of the project.
class FlatActionButtonComponent extends StatelessWidget {
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
  final double verticalPadding;

  /// The symmetric horizontal padding of this component.
  ///
  /// This has proprity over the [leftPadding] and [rightPadding] values.
  final double horizontalPadding;

  /// The spacing between the [prefixIcon], [labelText] and [suffixIcon] of this component.
  final double contentSpacing;

  /// The width of this component.
  final double width;

  /// The height of this component.
  final double height;

  /// The text to display on this component.
  final String labelText;

  /// The text color of this component.
  final Color textColor;

  /// The background color of this component.
  final Color backgroundColor;

  /// The highlight (on pressed) color of this component.
  final Color highlightColor;

  /// The border color of this component.
  final Color borderColor;

  /// The border radius (circular) of this component.
  final double borderRadius;

  /// The border width of this component.
  final double borderWidth;

  /// Sets the prefix icon visible of this component.
  final bool isPrefixIconVisible;

  /// Sets the suffix icon visible of this component.
  final bool isSuffixIconVisible;

  /// The prefix icon of this component.
  final IconData prefixIcon;

  /// The suffix icon of this component.
  final IconData suffixIcon;

  /// The icons size of this component.
  final double iconSize;

  /// The font size of this component.
  final double fontSize;

  /// The [onPressed] callback function of this component.
  final void Function() onPressedCallback;

  const FlatActionButtonComponent({
    Key key,
    this.leftPadding = 0,
    this.topPadding = 0,
    this.rightPadding = 0,
    this.bottomPadding = 0,
    this.verticalPadding,
    this.horizontalPadding,
    this.contentSpacing = 10,
    this.width,
    this.height,
    this.labelText = "Label text",
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.highlightColor = Colors.grey,
    this.borderColor = Colors.blueAccent,
    this.borderRadius = 0,
    this.borderWidth = 2,
    this.isPrefixIconVisible = false,
    this.isSuffixIconVisible = false,
    this.prefixIcon = FontAwesomeIcons.icons,
    this.suffixIcon = FontAwesomeIcons.icons,
    this.fontSize = 24,
    this.iconSize = 24,
    @required this.onPressedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: (horizontalPadding != null) ? horizontalPadding : leftPadding,
        top: (verticalPadding != null) ? verticalPadding : topPadding,
        right: (horizontalPadding != null) ? horizontalPadding : rightPadding,
        bottom: (verticalPadding != null) ? verticalPadding : bottomPadding,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: highlightColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(
              width: borderWidth,
              color: borderColor,
            ),
          ),
          onPressed: () {
            onPressedCallback();
          },
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: contentSpacing,
            children: [
              (isPrefixIconVisible)
                  ? Icon(
                      prefixIcon,
                      size: iconSize,
                    )
                  : Container(width: 0, height: 0),
              Text(
                labelText,
                style: TextStyle(fontSize: fontSize, color: textColor),
              ),
              (isSuffixIconVisible)
                  ? Icon(
                      suffixIcon,
                      size: iconSize,
                    )
                  : Container(width: 0, height: 0),
            ],
          ),
        ),
      ),
    );
  }
}

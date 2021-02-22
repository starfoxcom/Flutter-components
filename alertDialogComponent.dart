import 'package:flutter/material.dart';

import 'flatActionButtonComponent.dart';

/// Class component for an alert dialog.
///
/// This component class depends on the [FlatActionButtonComponent], make sure
/// that you have the component on your project added.
class AlertDialogComponent extends StatelessWidget {
  /// The background color of this component.
  final Color backgroundColor;

  /// The border color of this component.
  final Color borderColor;

  /// The border width of this component.
  final double borderWidth;

  /// The border radius of this component.
  final double borderRadius;

  /// The title text to display on this component.
  final String titleText;

  /// The title size of this component.
  final double titleSize;

  /// The title color of this component.
  final Color titleColor;

  /// The horizontal padding (for content width) of this component.
  final double horizontalPadding;

  /// The description text to display on this component.
  final String descriptionText;

  /// The description size of this component.
  final double descriptionSize;

  /// The description color of this component.
  final Color descriptionColor;

  /// The cancel button width of this component.
  final double cancelButtonWidth;

  /// The cancel button border radius of this component.
  final double cancelButtonBorderRadius;

  /// The cancel button border color of this component.
  final Color cancelButtonBorderColor;

  /// The cancel button background color of this component.
  final Color cancelButtonBackgroundColor;

  /// The cancel button text color of this component.
  final Color cancelButtonTextColor;

  /// The cancel button text to display on this component.
  final String cancelButtonText;

  /// The cancel button [onPressedCallback] callback function of this component.
  final void Function() onCancelCallback;

  /// The cancel button width of this component.
  final double okButtonWidth;

  /// The cancel button border radius of this component.
  final double okButtonBorderRadius;

  /// The cancel button border color of this component.
  final Color okButtonBorderColor;

  /// The cancel button background color of this component.
  final Color okButtonBackgroundColor;

  /// The cancel button text color of this component.
  final Color okButtonTextColor;

  /// The cancel button text to display on this component.
  final String okButtonText;

  /// The ok button [onPressedCallback] callback function of this component.
  final void Function() onOkCallback;
  const AlertDialogComponent({
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 2,
    this.borderRadius = 10,
    this.titleText = 'title text',
    this.titleSize = 20,
    this.titleColor = Colors.black,
    this.horizontalPadding = 0,
    this.descriptionText = 'description text',
    this.descriptionSize = 20,
    this.descriptionColor = Colors.black,
    this.cancelButtonWidth,
    this.cancelButtonBorderRadius = 0,
    this.cancelButtonBorderColor = Colors.blueAccent,
    this.cancelButtonBackgroundColor = Colors.white,
    this.cancelButtonTextColor = Colors.black,
    this.cancelButtonText = 'Cancel',
    @required this.onCancelCallback,
    this.okButtonWidth,
    this.okButtonBorderRadius = 0,
    this.okButtonBorderColor = Colors.blueAccent,
    this.okButtonBackgroundColor = Colors.white,
    this.okButtonTextColor = Colors.black,
    this.okButtonText = 'Ok',
    @required this.onOkCallback,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontSize: titleSize,
          color: titleColor,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 15,
              left: horizontalPadding,
              right: horizontalPadding,
            ),
            child: Text(
              descriptionText,
              style: TextStyle(
                fontSize: descriptionSize,
                color: descriptionColor,
              ),
            ),
          ),
          Wrap(
            spacing: 10,
            children: [
              FlatActionButtonComponent(
                width: cancelButtonWidth,
                borderRadius: cancelButtonBorderRadius,
                borderColor: cancelButtonBorderColor,
                backgroundColor: cancelButtonBackgroundColor,
                textColor: cancelButtonTextColor,
                labelText: cancelButtonText,
                onPressedCallback: () {
                  onCancelCallback();
                },
              ),
              FlatActionButtonComponent(
                width: okButtonWidth,
                borderRadius: okButtonBorderRadius,
                borderColor: okButtonBorderColor,
                backgroundColor: okButtonBackgroundColor,
                textColor: okButtonTextColor,
                labelText: okButtonText,
                onPressedCallback: () {
                  onOkCallback();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

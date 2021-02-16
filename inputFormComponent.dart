import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Class component for a input text form.
///
/// This component class depends of `font_awesome_flutter.dart`, consider adding
/// it to your dependencies on the `pubspec.yaml` file of the project.
class InputFormComponent extends StatefulWidget {
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

  /// The width of this component.
  final double width;

  /// The height of this component.
  final double height;

  /// The text height of this component.
  final double textHeight;

  /// The hint text of this component.
  final String hintText;

  /// The label text of this component.
  final String labelText;

  /// Sets to apply the background color of this component.
  final bool isBackgroundFilled;

  /// The background color of this component.
  final Color backgroundColor;

  /// Sets the border of this component.
  final bool isBorderEnabled;

  /// Sets the border to [OutlineInputBorder] or [UnderlineInputBorder] of this
  /// component.
  final bool isOutlineBorder;

  /// The enabled border color of this component.
  final Color enabledBorderColor;

  /// The enabled border width of this component.
  final double enabledBorderWidth;

  /// The enabled border color of this component.
  final Color focusedBorderColor;

  /// The enabled border width of this component.
  final double focusedBorderWidth;

  /// The enabled border color of this component.
  final Color errorBorderColor;

  /// The enabled border width of this component.
  final double errorBorderWidth;

  /// The enabled border color of this component.
  final Color focusedErrorBorderColor;

  /// The enabled border width of this component.
  final double focusedErrorBorderWidth;

  /// The border radius (circular) of this component.
  final double borderRadius;

  /// Sets the icon visible of this component.
  final bool isIconVisible;

  /// The icon of this component.
  final IconData icon;

  /// The prefix icon color of this component.
  final Color prefixIconColor;

  /// The suffix icon color of this component.
  final Color suffixIconColor;

  /// The icon size of this component.
  final double iconSize;

  /// Sets the obscure text of this component.
  final bool isObscureText;

  /// The font size of this component.
  final double fontSize;

  /// The text color of this component.
  final Color textColor;

  /// The input type to optimize the input control of this component.
  final TextInputType inputType;

  /// The input action from the input control of this component.
  final TextInputAction inputAction;

  /// The text editing controller of this component.
  final TextEditingController textController;

  /// Sets the validator requirement of this component.
  final bool requireValidation;

  /// The [validator] callback function of this component.
  final String Function(String) customValidatorCallback;

  const InputFormComponent({
    Key key,
    this.leftPadding = 0,
    this.topPadding = 0,
    this.rightPadding = 0,
    this.bottomPadding = 0,
    this.verticalPadding,
    this.horizontalPadding,
    this.width = 100,
    this.height = 100,
    this.textHeight = 1.5,
    this.hintText,
    this.labelText,
    this.isBackgroundFilled = true,
    this.backgroundColor = Colors.grey,
    this.isBorderEnabled = true,
    this.isOutlineBorder = true,
    this.enabledBorderColor = Colors.white,
    this.enabledBorderWidth = 1,
    this.focusedBorderColor = Colors.white,
    this.focusedBorderWidth = 2,
    this.errorBorderColor = Colors.red,
    this.errorBorderWidth = 1,
    this.focusedErrorBorderColor = Colors.red,
    this.focusedErrorBorderWidth = 2,
    this.borderRadius = 0,
    this.isIconVisible = true,
    this.icon = FontAwesomeIcons.icons,
    this.prefixIconColor = Colors.white,
    this.suffixIconColor = Colors.white,
    this.iconSize,
    this.isObscureText = false,
    this.fontSize = 24,
    this.textColor = Colors.white,
    this.inputType,
    this.inputAction,
    this.textController,
    this.requireValidation = false,
    this.customValidatorCallback,
  }) : super(key: key);
  @override
  _InputFormComponentState createState() => _InputFormComponentState();
}

class _InputFormComponentState extends State<InputFormComponent> {
  bool obscureText = true;

  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: (widget.horizontalPadding != null)
            ? widget.horizontalPadding
            : widget.leftPadding,
        top: (widget.verticalPadding != null)
            ? widget.verticalPadding
            : widget.topPadding,
        right: (widget.horizontalPadding != null)
            ? widget.horizontalPadding
            : widget.rightPadding,
        bottom: (widget.verticalPadding != null)
            ? widget.verticalPadding
            : widget.bottomPadding,
      ),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: TextFormField(
            controller: widget.textController,
            decoration: InputDecoration(
              filled: widget.isBackgroundFilled,
              fillColor: widget.backgroundColor,
              enabledBorder: (widget.isBorderEnabled)
                  ? (widget.isOutlineBorder)
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.enabledBorderColor,
                              width: widget.enabledBorderWidth),
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius))
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.enabledBorderColor,
                              width: widget.enabledBorderWidth),
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius))
                  : OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.circular(widget.borderRadius)),
              focusedBorder: (widget.isBorderEnabled)
                  ? (widget.isOutlineBorder)
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.focusedBorderColor,
                              width: widget.focusedBorderWidth),
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius))
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.focusedBorderColor,
                              width: widget.focusedBorderWidth),
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius))
                  : OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.circular(widget.borderRadius)),
              errorBorder: (widget.isBorderEnabled)
                  ? (widget.isOutlineBorder)
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.errorBorderColor,
                              width: widget.errorBorderWidth),
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius))
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.errorBorderColor,
                              width: widget.errorBorderWidth),
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius))
                  : OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.circular(widget.borderRadius)),
              focusedErrorBorder: (widget.isBorderEnabled)
                  ? (widget.isOutlineBorder)
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.focusedErrorBorderColor,
                              width: widget.focusedErrorBorderWidth),
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius))
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.focusedErrorBorderColor,
                              width: widget.focusedErrorBorderWidth),
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius))
                  : OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.circular(widget.borderRadius)),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: (widget.isIconVisible) ? 20.0 : 0,
                ),
                child: Icon(
                  (widget.isIconVisible) ? widget.icon : null,
                  size: widget.iconSize,
                  color: widget.prefixIconColor,
                ),
              ),
              suffixIcon: (widget.isObscureText)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: IconButton(
                        icon: (obscureText)
                            ? Icon(FontAwesomeIcons.solidEyeSlash,
                                color: widget.suffixIconColor)
                            : Icon(FontAwesomeIcons.solidEye,
                                color: widget.suffixIconColor),
                        onPressed: () {
                          _toggleObscure();
                        },
                      ),
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.textColor.withOpacity(0.5)),
              helperText: '',
              labelText: widget.labelText,
              labelStyle: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.textColor.withOpacity(0.5)),
            ),
            validator: (value) {
              if (widget.requireValidation) {
                if (value.isEmpty) {
                  return 'Required field';
                }
                return widget.customValidatorCallback(value);
              }
              return null;
            },
            obscureText: (widget.isObscureText) ? obscureText : false,
            style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor,
                height: widget.textHeight),
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
          ),
        ),
      ),
    );
  }

  void _toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

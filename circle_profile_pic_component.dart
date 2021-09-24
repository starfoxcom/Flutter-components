import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'iconButtonComponent.dart';
import 'package:universal_io/io.dart';

/// Class component for a circular profile picture
///
/// This component class depends of the following packages:
///
/// * `font_awesome_flutter`
/// * `image_picker`
/// * `universal_io`
///
/// consider adding them to your dependencies on the `pubspec.yaml`
/// file of the project.
///
/// Also, it depends of the following class component:
/// * `iconButtonComponent`
///
/// Consider adding this component to your project.
class CircleProfilePicComponent extends StatefulWidget {
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

  /// The background color of this component.
  final Color backgroundColor;

  /// The radius of this circular component.
  final double profilePicRadius;

  /// Sets the network image of this component.
  final bool isNetworkImage;

  /// The URL string of the network image of this component.
  final String networkImageURL;

  /// The icon of this component.
  final IconData profilePicIcon;

  /// The icon color of this component.
  final Color iconColor;

  /// Sets the edit button visible of this component.
  final bool isEditable;

  /// The shape of this component.
  final BoxShape boxShape;

  /// The edit button border radius (circular) of this component.
  ///
  /// Ignored in case that [boxShape] is not a rectangle.
  final double editBorderRadius;

  /// The background color of the edit button of this component.
  final Color editBackgroundColor;

  /// The border color of the edit button of this component.
  final Color editBorderColor;

  /// The border width of the edit button of this component.
  final double editBorderWidth;

  /// The icon of the edit button of this component.
  final IconData editIcon;

  /// The icon colof of the edit button of this component.
  final Color editIconColor;
  const CircleProfilePicComponent({
    Key? key,
    this.leftPadding = 0,
    this.topPadding = 0,
    this.rightPadding = 0,
    this.bottomPadding = 0,
    this.verticalPadding,
    this.horizontalPadding,
    this.backgroundColor = Colors.white,
    this.profilePicRadius = 50,
    this.isNetworkImage = false,
    this.networkImageURL = '',
    this.profilePicIcon = FontAwesomeIcons.user,
    this.iconColor = Colors.black,
    this.isEditable = false,
    this.boxShape = BoxShape.circle,
    this.editBorderRadius = 0,
    this.editBackgroundColor = Colors.white,
    this.editBorderColor = Colors.black,
    this.editBorderWidth = 1,
    this.editIcon = Icons.edit,
    this.editIconColor = Colors.black,
  }) : super(key: key);

  @override
  _CircleProfilePicComponentState createState() =>
      _CircleProfilePicComponentState();
}

class _CircleProfilePicComponentState extends State<CircleProfilePicComponent> {
  final ImagePicker _picker = ImagePicker();
  dynamic _image;
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _imgFromCamera() async {
    XFile? image;
    try {
      image =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      setState(() {
        _image = File(image!.path);
      });
    } catch (e) {
      print(e);
    }
  }

  Future _imgFromGallery() async {
    XFile? image;
    try {
      image = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      setState(() {
        _image = File(image!.path);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: widget.horizontalPadding ?? widget.leftPadding,
            top: widget.verticalPadding ?? widget.topPadding,
            right: widget.horizontalPadding ?? widget.rightPadding,
            bottom: widget.verticalPadding ?? widget.bottomPadding,
          ),
          child: CircleAvatar(
            backgroundColor: widget.backgroundColor,
            radius: widget.profilePicRadius,
            backgroundImage: (widget.isNetworkImage)
                ? NetworkImage(widget.networkImageURL)
                : (_image != null)
                    ? FileImage(_image) as ImageProvider
                    : null,
            child: (_image == null && !widget.isNetworkImage)
                ? Icon(
                    widget.profilePicIcon,
                    size: widget.profilePicRadius * 0.6,
                    color: widget.iconColor,
                  )
                : null,
          ),
        ),
        (widget.isEditable)
            ? Positioned(
                top: (widget.verticalPadding != null)
                    ? widget.verticalPadding
                    : widget.topPadding,
                left: (widget.horizontalPadding != null)
                    ? widget.horizontalPadding
                    : widget.leftPadding,
                child: IconButtonComponent(
                  onTapCallback: () {
                    _showPicker(context);
                  },
                  height: widget.profilePicRadius * 0.7,
                  width: widget.profilePicRadius * 0.7,
                  boxShape: widget.boxShape,
                  borderRadius: widget.editBorderRadius,
                  backgroundColor: widget.editBackgroundColor,
                  borderColor: widget.editBorderColor,
                  borderWidth: widget.editBorderWidth,
                  icon: widget.editIcon,
                  iconColor: widget.iconColor,
                  iconSize: widget.profilePicRadius * 0.4,
                ),
              )
            : Container(
                width: 0,
                height: 0,
              ),
      ],
    );
  }
}

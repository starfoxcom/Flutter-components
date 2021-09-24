import 'package:universal_io/io.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

class ScreenshotController {
  GlobalKey containerKey;

  ScreenshotController({GlobalKey key}) {
    containerKey = key ?? GlobalKey();
  }

  Future<File> captureAsFile(
      {String path = "",
      double pixelRatio: 1.0,
      Duration delay: const Duration(milliseconds: 20)}) {
    //DElay is required. See Issue https://github.com/flutter/flutter/issues/22308
    return Future.delayed(delay, () async {
      try {
        RenderRepaintBoundary boundary =
            this.containerKey.currentContext.findRenderObject();
        ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
        ByteData byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData.buffer.asUint8List();
        if (path == "") {
          final directory = (await getApplicationDocumentsDirectory()).path;
          String fileName = DateTime.now().toIso8601String();
          path = '$directory/$fileName.png';
        }
        File imgFile = File(path);
        await imgFile.writeAsBytes(pngBytes);
        return imgFile;
      } catch (Exception) {
        throw (Exception);
      }
    });
  }

  Future<ui.Image> captureAsUiImage(
      {double pixelRatio: 1,
      Duration delay: const Duration(milliseconds: 20)}) {
    //Delay is required. See Issue https://github.com/flutter/flutter/issues/22308
    return Future.delayed(delay, () async {
      try {
        RenderRepaintBoundary boundary =
            this.containerKey.currentContext.findRenderObject();
        return await boundary.toImage(pixelRatio: pixelRatio);
      } catch (Exception) {
        throw (Exception);
      }
    });
  }

  Future<ByteData> captureAsByteData(
      {double pixelRatio: 1,
      Duration delay: const Duration(milliseconds: 20)}) {
    //Delay is required. See Issue https://github.com/flutter/flutter/issues/22308
    return Future.delayed(delay, () async {
      try {
        RenderRepaintBoundary boundary =
            this.containerKey.currentContext.findRenderObject();
        ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
        ByteData byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        return byteData;
      } catch (Exception) {
        throw (Exception);
      }
    });
  }

  Future<Uint8List> captureAsUint8List(
      {double pixelRatio: 1,
      Duration delay: const Duration(milliseconds: 20)}) {
    //Delay is required. See Issue https://github.com/flutter/flutter/issues/22308
    return Future.delayed(delay, () async {
      try {
        RenderRepaintBoundary boundary =
            this.containerKey.currentContext.findRenderObject();
        ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
        ByteData byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData.buffer.asUint8List();
        return pngBytes;
      } catch (Exception) {
        throw (Exception);
      }
    });
  }
}

class ScreenshotContainer extends StatefulWidget {
  final Widget child;
  final ScreenshotController controller;
  final GlobalKey containerKey;

  const ScreenshotContainer(
      {Key key, this.controller, this.containerKey, this.child})
      : super(key: key);
  @override
  _ScreenshotContainerState createState() => _ScreenshotContainerState();
}

class _ScreenshotContainerState extends State<ScreenshotContainer>
    with TickerProviderStateMixin {
  ScreenshotController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ScreenshotController();
    } else {
      _controller = widget.controller;
    }
  }

  @override
  void didUpdateWidget(ScreenshotContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      widget.controller.containerKey = oldWidget.controller.containerKey;
      if (oldWidget.controller != null && widget.controller == null)
        _controller.containerKey = oldWidget.controller.containerKey;
      if (widget.controller != null) {
        if (oldWidget.controller == null) {
          _controller = null;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _controller.containerKey,
      child: widget.child,
    );
  }
}

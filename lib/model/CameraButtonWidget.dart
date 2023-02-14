import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'listtile.dart';

class CameraButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTileWidget(
    text: 'From Camera',
    icon: Icons.camera_alt,
    onClicked: () => pickCameraMedia(context), key: null,
  );
  Future pickCameraMedia(BuildContext context) async {
    final Object? source = ModalRoute.of(context)!.settings.arguments;

    final getMedia = ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.camera);
    final file = File(media!.path);

    Navigator.of(context).pop(file);
  }
}

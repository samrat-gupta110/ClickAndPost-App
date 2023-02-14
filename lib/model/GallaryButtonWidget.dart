//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'listtile.dart';

class GalleryButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListTileWidget(
    text: 'From Gallery',
    icon: Icons.photo,
    onClicked: () => pickGalleryMedia(context), key: null,
  );

  Future pickGalleryMedia(BuildContext context) async{
    final Object? source = ModalRoute.of(context)!.settings.arguments;

    final getMedia = ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.gallery);
    final file = File(media!.path);

    Navigator.of(context).pop(file);
  }
  }
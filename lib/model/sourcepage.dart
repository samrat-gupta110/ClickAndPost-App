import 'package:flutter/material.dart';
import 'package:postvideos/model/CameraButtonWidget.dart';
import 'package:postvideos/model/GallaryButtonWidget.dart';

class SourcePage extends StatelessWidget {
  const SourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Source'),
      ),
      body: ListView(
        children: [
          CameraButtonWidget(),
          GalleryButtonWidget(),
        ],
      ),
    );
  }
}

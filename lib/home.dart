//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:postvideos/model/sourcepage.dart';
import 'package:postvideos/model/videowidget.dart';
import 'package:video_player/video_player.dart';
import 'model/media_source.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
   File? fileMedia;
   MediaSource? source;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: fileMedia == null
                      ? Icon(Icons.photo, size: 120,)
                      :(source == MediaSource.image ? Image.file(fileMedia!) : VideoWidget(fileMedia!)),
              ),
              const SizedBox(height: 24),
              RaisedButton(
                child: Text('Capture Video'), //Capture Videos.
                  shape: StadiumBorder(),
                  onPressed:(){
                  capture(MediaSource.video);
                  },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
              RaisedButton(
                child: Text('Save Video'),  //Save Videos.
                shape: StadiumBorder(),
                onPressed:(){
                  capture(MediaSource.video);
                },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future capture(MediaSource source) async{
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context)=> SourcePage(),
          settings: RouteSettings(
            arguments: source
          )
      )
    );
    if(result == null){
        return;
      } else {
        setState(() {
          fileMedia = result;
        });
      }
  }
}

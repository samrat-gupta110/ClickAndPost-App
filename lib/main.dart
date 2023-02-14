//import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:postvideos/home.dart';
import 'package:postvideos/otp.dart';
import 'package:postvideos/phone.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone':(context) => MyPhone(),
      'otp': (context) => MyOtp(),
      'home': (context) => MyHome(),
    },
  ));
}

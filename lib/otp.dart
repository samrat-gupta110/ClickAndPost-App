//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:postvideos/phone.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({Key? key}) : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
                Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo2.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Phone Verfications',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'You need to register your phone before getting started',
                style: TextStyle(fontSize: 22,),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value){
                  code = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async{
                    try{
                      PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(verificationId: MyPhone.verify, smsCode: code);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(
                          context, "home", (route) => false);
                    }
                    catch(e) {
                      print("Wrong OTP");
                    }
                  },
                  child: Text(
                    'Verify Phone Number',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, "phone");
                      },
                      child: Text(
                        'Edit Phone Number ?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

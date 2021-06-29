import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_over/Themes/app_color.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool _flashOn = false;
  bool _frontCam = false;
  GlobalKey _qrkey = GlobalKey();
  // late QRViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Text('Scanner',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: AppColor.kwhite,
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _flashOn = !_flashOn;
                    });
                    //_controller.toggleFlash();
                  },
                  icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off),
                  color: AppColor.kwhite,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _frontCam = !_frontCam;
                    });
                  },
                  icon:
                      Icon(_frontCam ? Icons.camera_front : Icons.camera_rear),
                  color: AppColor.kwhite,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                  color: AppColor.kwhite,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

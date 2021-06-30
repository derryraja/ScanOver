import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_over/Themes/app_color.dart';
import 'package:scan_over/home_page.dart';

class Scanner extends StatefulWidget {
  //const Scanner({Key? key}) : super(key: key);
  String scanBarcode = 'Unknown';
  Scanner(this.scanBarcode);

  @override
  _ScannerState createState() => _ScannerState(this.scanBarcode);
}

class _ScannerState extends State<Scanner> {
  String scanBarcode;
  _ScannerState(this.scanBarcode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kwhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 40),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.kprimaryColor,
                    size: 27,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 60, bottom: 40),
              child: Column(
                children: [
                  Center(
                    child: Text('Code Scanned',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: AppColor.kdarkestGrey,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text('Here are the scan results',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: AppColor.klightGrey,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/qr_scanned.png',
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text('$scanBarcode\n',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: AppColor.kprimaryColor,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 90,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

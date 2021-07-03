import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_over/Themes/app_color.dart';
import 'package:scan_over/createqr_page.dart';
import 'package:scan_over/scanner_page.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_over/scannerf_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String scanBarcode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 40),
        child: Column(
          children: [
            Center(
              child: Text('Scan QR Code',
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
              child: Text(
                  'Tap the animation to open the camera\nand scan QR codes',
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
            GestureDetector(
              onTap: () => scanQR(),
              child: Lottie.asset('assets/lf30_editor_undegko1.json',
                  height: 250, width: 250),
            ),
            SizedBox(
              height: 120,
            ),
            Text('or you can',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: AppColor.klightGrey,
                  fontWeight: FontWeight.normal,
                )),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateQR()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.kprimaryColor,
                ),
                child: Center(
                  child: Text('Make QR Codes',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: AppColor.kwhite,
                        fontWeight: FontWeight.normal,
                      )),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void scanQR() async {
    String barcodeScanRes;
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#EA5F2D', 'Cancel', true, ScanMode.QR);
    if (barcodeScanRes == '-1') {
      scanBarcode = 'Failed';
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Scannerf(scanBarcode)));
    } else {
      scanBarcode = barcodeScanRes;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Scanner(scanBarcode)));
    }
  }
}

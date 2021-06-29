import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_over/home_page.dart';

import 'Themes/app_color.dart';

class CreateQR extends StatefulWidget {
  const CreateQR({Key? key}) : super(key: key);

  @override
  _CreateQRState createState() => _CreateQRState();
}

class _CreateQRState extends State<CreateQR> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Text('Create QR Codes',
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
                        'Type in the text box below\nto create your QR Code',
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
                  BarcodeWidget(
                      data: controller.text,
                      width: 200,
                      height: 200,
                      color: AppColor.kdarkestGrey,
                      barcode: Barcode.qrCode()),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Expanded(child: buildTextField(context)),
                      const SizedBox(
                        width: 22,
                      ),
                      FloatingActionButton(
                          backgroundColor: AppColor.kprimaryColor,
                          elevation: 0,
                          child: Icon(
                            Icons.done,
                            size: 30,
                          ),
                          onPressed: () => setState(() {}))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          color: AppColor.kdarkestGrey,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: 'Enter text',
          hintStyle: GoogleFonts.montserrat(
            fontSize: 16,
            color: AppColor.klightGrey,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColor.klightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColor.kprimaryColor,
            ),
          ),
        ),
      );
}

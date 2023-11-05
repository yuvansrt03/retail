import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:retail/shop_screen.dart';

class qrscanner extends StatefulWidget {
  const qrscanner({super.key});

  @override
  State<qrscanner> createState() => _qrscannerState();
}

class _qrscannerState extends State<qrscanner> {
  final qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildqrview(context),
          Positioned(
            bottom: 10,
            child: buildResult(),
          )
        ],
      ),
    );
  }

  Widget buildResult() => Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          barcode != null ? 'Result: ${barcode!.code}' : 'Scan a code!',
          maxLines: 3,
        ),
      );

  Widget buildqrview(BuildContext context) => QRView(
        key: qrkey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderLength: 20,
          borderColor: Color(0xff46BDFA),
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;

        // Check if a barcode is scanned successfully
        if (barcode != null) {
          // Navigate to the shop_screen with the scanned barcode
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => shop_screen(barcode.code.toString()),
            ),
          );
        }
      });
    });
  }
}

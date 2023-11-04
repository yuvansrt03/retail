import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ClickToAddScreen extends StatelessWidget {
  const ClickToAddScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Click to Add Shop"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScreen()),
                );
              },
              child: Text("Scan to add shop"),
            ),
          ],
        ),
      ),
    );
  }
}

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key});

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  late CameraController cameraController;
  late QRViewController qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();

    // Initialize the camera
    availableCameras().then((cameras) {
      cameraController = CameraController(cameras[0], ResolutionPreset.medium);
      cameraController.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    qrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: cameraController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController),
                    )
                  : Container(),
            ),
          ),
          Expanded(
            child: Container(
              child: QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  this.qrController = controller;
                  controller.scannedDataStream.listen((scanData) {
                    // Handle the scanned QR code data here
                    print(scanData);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

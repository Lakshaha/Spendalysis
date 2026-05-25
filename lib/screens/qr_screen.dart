import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:spendalysis/screens/payment_Screen.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String qrResult = "Scanned Data will appear here";

  bool isScanned = false;
  String upiID = "";
  String Merchant = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              if (isScanned) return; //qr scanned already

              final List<Barcode> barcodes = capture.barcodes;

              for (final barcode in barcodes) {
                final String code = barcode.rawValue ?? '';
                if (code.isNotEmpty) {
                  isScanned = true;
                }

                Uri uri = Uri.parse(code);

                upiID = uri.queryParameters['pa'] ?? 'No UPI ID';
                Merchant = uri.queryParameters['pn'] ?? 'Unknown Merchant';

                setState(() {
                  qrResult = "Merchant Name: $Merchant\nUPI ID: $upiID";
                });
                break;
              }
            },
          ),
          if (isScanned)
            Align(
              alignment: Alignment(0, 0.8),
              child: Container(
                alignment: Alignment(0, 0.8),

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(5),
                    child: Text(
                      "upiID: $upiID\nMerchant: $Merchant",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),

          Align(
            alignment: AlignmentGeometry.xy(0, 0.7),
            child: Padding(
              padding: EdgeInsetsGeometry.only(bottom: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB8AF93),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentScreen(upiId: upiID, merchantName: Merchant),
                    ),
                  );
                },
                child: Text(
                  "Proceed to pay",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

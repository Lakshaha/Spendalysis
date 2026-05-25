import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends StatefulWidget {
  final String upiId;
  final String merchantName;

  const PaymentScreen({
    super.key,
    required this.upiId,
    required this.merchantName,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController amountController = TextEditingController();

  Future<void> makePayemnt() async {
    String amount = amountController.text.trim();

    if (amount.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Enter Amount to Pay")));
      return;
    }

    final Uri upiUri = Uri.parse(
      "upi://pay"
      "?pa=${widget.upiId}"
      "&pn=${widget.merchantName}"
      "&am=$amount"
      "&cu=INR"
      "&tn=Payment",
    );

    try {
      await launchUrl(upiUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Could not launch UPI app")));
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(color: Color(0xE62A3951)),
                child: Column(
                  children: [
                    Text(
                      "Paying to",
                      style: TextStyle(fontSize: 24, color: Color(0xFFB8AF93)),
                    ),
                    Text(
                      widget.merchantName,
                      style: TextStyle(fontSize: 18, color: Color(0xFFB8AF93)),
                    ),
                    Text(
                      widget.upiId,
                      style: TextStyle(fontSize: 18, color: Color(0xFFB8AF93)),
                    ),

                    SizedBox(height: 30),
                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: "Enter amount to pay",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFB8AF93),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 120),
              ElevatedButton(
                onPressed: makePayemnt,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                child: Text(
                  "Proceed to pay",
                  style: TextStyle(fontSize: 24, color: Colors.amberAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

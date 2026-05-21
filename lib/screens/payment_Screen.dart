import 'package:flutter/material.dart';

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
          child: Container(
            alignment: AlignmentDirectional.center,
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              height: 100,
              width: 200,
              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  children: [
                    Text(
                      "Enter Amount to Pay",
                      style: TextStyle(fontSize: 18, color: Colors.amberAccent),
                    ),
                    Spacer(),
                    Text("Paying to: ${widget.merchantName}"),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

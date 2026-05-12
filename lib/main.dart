import 'package:flutter/material.dart';
import 'package:spendalysis/database/hive_service.dart';
import '../screens/category.dart';
import '../screens/general_category.dart';
import '../screens/qr_screen.dart';
import '../screens/sign_up.dart';
import '../screens/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/sign_in',

      routes: {
        '/sign_in': (context) => const SignInScreen(),
        '/sign_up': (context) => const SignUpScreen(),
        '/qr_screen': (context) => const QrScreen(),
        '/category': (context) => const CategoryScreen(),
        '/general_category': (context) => const GeneralCategoryScreen(),
      },
    );
  }
}

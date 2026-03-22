import 'package:hive_flutter/hive_flutter.dart';

import '../models/category.dart';
import '../models/expense.dart';
import '../models/qr_code.dart';

class HiveService {
  static Future<void> init() async {
    //hive init
    await Hive.initFlutter();

    //reg adapter
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(ExpenseAdapter());
    Hive.registerAdapter(QrCodeAdapter());

    //open boxes
    await Hive.openBox<QrCode>('qr_codes');
    await Hive.openBox<Expense>('expenses');
    await Hive.openBox<Category>('categories');

    print('Hive init succ');
  }
}

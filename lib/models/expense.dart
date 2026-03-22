import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 1)
class Expense extends HiveObject {
  @HiveField(0)
  double amount;

  @HiveField(1)
  String spot;

  @HiveField(2)
  int categoryId;

  @HiveField(3)
  DateTime date;

  Expense({
    required this.amount,
    required this.spot,
    required this.categoryId,
    required this.date,
  });
}

import 'package:hive/hive.dart';
import '../../models/expense.dart';

class CategoryRepo {
  final Box<Expense> box = Hive.box<Expense>('categories');

  void addCategory(Expense expense) {
    box.add(expense);
  }

  List<Expense> getAllCategories() {
    return box.values.toList();
  }

  void deleteExpense(int index) {
    box.delete(index);
  }

  double getTotalAmount() {
    return box.values.fold(0, (sum, e) => sum + e.amount);
  }
}

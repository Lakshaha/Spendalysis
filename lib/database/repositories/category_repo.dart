import 'package:hive/hive.dart';
import '../../models/category.dart';

class CategoryRepo {
  final Box<Category> box = Hive.box<Category>('categories');

  void addCategory(Category category) {
    box.add(category);
  }

  List<Category> getAllCategories() {
    return box.values.toList();
  }

  Category getById(int id) {
    return box.values.firstWhere(
      (c) => c.id == id,
      orElse: () => Category(id: -1, name: 'Unknown'),
    );
  }

  void deleteCategory(int index) {
    box.delete(index);
  }
}

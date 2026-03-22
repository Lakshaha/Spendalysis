import 'package:hive/hive.dart';
import '../../models/qr_code.dart';

class QRRepo {
  final Box<QrCode> box = Hive.box<QrCode>('categories');

  void addCategory(QrCode qr) {
    box.add(qr);
  }

  List<QrCode> getAllQRs() {
    return box.values.toList();
  }

  List<QrCode> getByCategory(int categoryId) {
    return box.values.where((qr) => qr.categoryId == categoryId).toList();
  }

  void deleteCategory(int index) {
    box.delete(index);
  }
}

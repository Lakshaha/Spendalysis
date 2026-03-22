import 'package:hive/hive.dart';

part 'qr_code.g.dart';

@HiveType(typeId: 2)
class QrCode extends HiveObject {
  @HiveField(0)
  String qrUrl;

  @HiveField(1)
  int categoryId;

  QrCode({required this.qrUrl, required this.categoryId});
}

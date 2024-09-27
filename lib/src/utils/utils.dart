import 'package:intl/intl.dart';

class Utils {
  static double parsingToDouble(dynamic src) {
    if (src == null) {
      return 0;
    } else if (src is String) {
      return double.tryParse(src) ?? 0;
    } else if (src is int) {
      return src.toDouble();
    } else {
      return src;
    }
  }

  static String getCurrency(double? idr, {bool isNegative = false}) {
    if (idr != null) {
      final str = idr.toStringAsFixed(2);
      final num = double.parse(str);
      final currency = NumberFormat("###,###.###", "ID").format(num);
      return 'Rp ${isNegative ? "-" : ""}$currency';
    }
    return 'Rp 0';
  }
}

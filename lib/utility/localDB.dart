import 'package:question/main.dart';

class LocalDB {
  static void setPoint(int point) => sharedPreferences.setInt('point', point);
  static int? get getPoint => sharedPreferences.getInt('point');
}

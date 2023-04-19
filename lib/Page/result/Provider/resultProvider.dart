import 'package:flutter/material.dart';
import 'package:question/Page/Welcome/startView.dart';
import 'package:question/utility/localDB.dart';

class ResultProvider extends ChangeNotifier {
  int _point = 20;
  int get point => _point;

  void initAnswerAction(
      BuildContext context, List<Map<String, dynamic>> answerList) {
    LocalDB.setPoint(20);
    print(answerList);
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => StartView()),
    //   ),
    // );
    notifyListeners();
  }
}

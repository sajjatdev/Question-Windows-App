import 'dart:async';
import 'package:flutter/material.dart';
import 'package:question/Page/result/resultView.dart';
import 'package:question/data/data.dart';

class DashboardProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _data = [];
  List<Map<String, dynamic>> get data => _data;

  Map<String, dynamic> _seleteItem = {};
  Map<String, dynamic> get seleteItem => _seleteItem;

  Timer? timer;
  Duration _duration = const Duration(seconds: 10);
  Duration get duration => _duration;

  List<Map<String, dynamic>> answerList = [];

  int _itemCount = 0;
  int count = 0;
  int get itemCount => _itemCount;

  void initQuestionAction() {
    _data = appData.map((e) => e).toList();
    notifyListeners();
  }

  void startTimerAction(BuildContext context) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final second = duration.inSeconds + -1;
      if (second < 0) {
        timer.cancel();
        count++;
        if (count < _data.length) {
          _itemCount++;

          if (_data[_itemCount]['type'] == 'map') {
            _duration = const Duration(seconds: 10);

            if (_seleteItem.isNotEmpty) {
              answerList.add(_seleteItem);
            }
          } else {
            _duration = const Duration(seconds: 5);
          }
          notifyListeners();
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => ResultView(
                answerList: answerList,
              ),
            ),
            (route) => false,
          );
        }
      } else {
        _duration = Duration(seconds: second);
        notifyListeners();
      }
    });
  }

  void onSelectItemAction({required int qid, required int selete}) {
    _seleteItem = {'qid': qid, 'select': selete};
    notifyListeners();
  }
}

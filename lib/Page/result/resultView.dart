import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:question/Page/result/Provider/resultProvider.dart';
import 'package:question/utility/localDB.dart';
import 'package:sizer/sizer.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.answerList});
  final List<Map<String, dynamic>> answerList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ResultProvider()..initAnswerAction(context, answerList),
      child: Consumer<ResultProvider>(builder: (context, stateAction, __) {
        return Scaffold(
          backgroundColor: HexColor("#E7D2AB"),
          body: SafeArea(
            child: Center(
                child: Text(
              "Point " + LocalDB.getPoint.toString(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                    fontFamily: 'Alkatra',
                  ),
            )),
          ),
        );
      }),
    );
  }
}

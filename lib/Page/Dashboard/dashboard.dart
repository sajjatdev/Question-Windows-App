import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'package:question/utility/localDB.dart';
import 'package:sizer/sizer.dart';
import 'Provider/dashboardProvider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardProvider()
        ..initQuestionAction()
        ..startTimerAction(context),
      child: Consumer<DashboardProvider>(builder: (context, stateAction, __) {
        if (stateAction.duration.inSeconds == 0 &&
            stateAction.itemCount < stateAction.data.length) {
          Provider.of<DashboardProvider>(context).startTimerAction(context);
        }
        return Scaffold(
          backgroundColor: HexColor("#E7D2AB"),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image.asset(
                  stateAction.data[stateAction.itemCount]['type'] == "map"
                      ? stateAction.data[stateAction.itemCount]['image']
                          .toString()
                      : stateAction.data[stateAction.itemCount]['image']
                          .toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Image.asset(
                'assets/Border.png',
                width: 100.h,
                height: 100.w,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 11.w,
                right: 5.w,
                child: SizedBox(
                  width: 27.w,
                  child: Text(
                    " ${twoDigits(stateAction.duration.inMinutes.remainder(60))}:${twoDigits(stateAction.duration.inSeconds.remainder(60))}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.oswald().fontFamily,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8.w,
                left: 16.w,
                child: Text(
                  LocalDB.getPoint != null
                      ? LocalDB.getPoint.toString() + ".0"
                      : "00.0",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alkatra',
                  ),
                ),
              ),
              if (stateAction.data[stateAction.itemCount]['type'] ==
                  "question") ...[
                Positioned(
                  top: 50.sp,
                  child: Text(
                    stateAction.data[stateAction.itemCount]['title'],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 70.sp,
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    child: Column(
                      children: (stateAction.data[stateAction.itemCount]
                              ['options'] as List)
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<DashboardProvider>(context,
                                      listen: false)
                                    ..onSelectItemAction(
                                      qid: stateAction
                                          .data[stateAction.itemCount]['id'],
                                      selete: e['value'],
                                      answer: stateAction
                                              .data[stateAction.itemCount]
                                          ['answer'],
                                      point: stateAction
                                          .data[stateAction.itemCount]['point'],
                                    )
                                    ..startTimerAction(context, isClick: true);
                                },
                                child: Container(
                                  width: 100.w,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          e['value'].toString() + ".",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8.sp,
                                                fontWeight: stateAction.data[
                                                                    stateAction
                                                                        .itemCount]
                                                                ['id'] ==
                                                            stateAction
                                                                    .seleteItem[
                                                                'qid'] &&
                                                        e['value'] ==
                                                            stateAction
                                                                    .seleteItem[
                                                                'select']
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: stateAction.data[stateAction
                                                                    .itemCount]
                                                                ['id'] ==
                                                            stateAction
                                                                    .seleteItem[
                                                                'qid'] &&
                                                        e['value'] ==
                                                            stateAction
                                                                    .seleteItem[
                                                                'select']
                                                    ? Color.fromARGB(
                                                        255, 0, 77, 3)
                                                    : Colors.black,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 10.sp,
                                        ),
                                        Text(
                                          e['text'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8.sp,
                                                fontWeight: stateAction.data[
                                                                    stateAction
                                                                        .itemCount]
                                                                ['id'] ==
                                                            stateAction
                                                                    .seleteItem[
                                                                'qid'] &&
                                                        e['value'] ==
                                                            stateAction
                                                                    .seleteItem[
                                                                'select']
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: stateAction.data[stateAction
                                                                    .itemCount]
                                                                ['id'] ==
                                                            stateAction
                                                                    .seleteItem[
                                                                'qid'] &&
                                                        e['value'] ==
                                                            stateAction
                                                                    .seleteItem[
                                                                'select']
                                                    ? Color.fromARGB(
                                                        255, 0, 77, 3)
                                                    : Colors.black,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )
              ]
            ],
          ),
        );
      }),
    );
  }
}

extension SystemSetting on dynamic {
  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  bool get selectItem {
    int questionId = this.stateAction.data[this.itemCount]['id'];

    return false;
  }
}

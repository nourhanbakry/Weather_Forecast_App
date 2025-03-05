import 'package:cellula_project/features/home/presenation/ui/screens/after_tomorrow_screen.dart';
import 'package:cellula_project/features/home/presenation/ui/screens/today_screen.dart';
import 'package:cellula_project/features/home/presenation/ui/screens/tomorrow_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
        TodayScreen(),
        TomorrowScreen(),
        AfterTomorrowScreen(),
    ],);
  }
}

import 'package:cellula_project/core/constants/app_colors.dart';
import 'package:cellula_project/core/constants/app_text_styles.dart';
import 'package:cellula_project/features/home/presenation/ui/widgets/custom_tab_item.dart';
import 'package:flutter/material.dart';

class CustomTabBarBottom extends StatelessWidget {
  const CustomTabBarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 90,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TabBar(
          labelStyle: AppTextStyles.font26ExtraBold,
          labelColor: AppColors.lightBlue,
          dividerColor: Colors.transparent,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          tabs: List.generate(
            3,
            (index) {
              DateTime date = DateTime.now().add(Duration(days: index));
              return CustomTabItem(
                day: getWeekDay(date.weekday),
                date: "${date.day}",
              );
            },
          ),
        ),
      ),
    );
  }
}

String getWeekDay(int weekday) {
  List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  return days[weekday % 7];
}

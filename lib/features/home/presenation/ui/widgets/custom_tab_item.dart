import 'package:flutter/material.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({super.key, required this.day, required this.date});
  final String day;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day),
            SizedBox(height: 10),
            Text(date),
          ],
        ),
      ),
    );
  }
}

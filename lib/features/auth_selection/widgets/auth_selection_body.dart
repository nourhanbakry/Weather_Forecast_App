import 'package:cellula_project/core/helper/extensions.dart';
import 'package:cellula_project/features/auth_selection/widgets/auth_selection_buttons.dart';
import 'package:flutter/material.dart';

class AuthSelectionBody extends StatelessWidget {
  const AuthSelectionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.screenHight() * 0.55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(190),
              bottomRight: Radius.circular(190),
            ),
          ),
        ),
        SizedBox(height: context.screenHight() * 0.15),
        AuthSelectionButtons(),
      ],
    );
  }
}

import 'package:dev_cv/components/step_circle.dart';
import 'package:flutter/material.dart';

class StepList extends StatelessWidget {
  final int currentStep;

  const StepList({
    required this.currentStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int step = 1; step <= 5; step++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: StepCircle(
              isActive: currentStep == step,
            ),
          ),
      ],
    );
  }
}

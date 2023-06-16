import 'package:flutter/material.dart';

class GeneralContainer extends StatelessWidget {
  final Widget child;
  const GeneralContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.4)),
        ),
        child: child,
      ),
    );
  }
}

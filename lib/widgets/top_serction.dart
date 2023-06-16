import 'package:flutter/material.dart';
import 'package:gotechtest/utils/device_utils.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Container(
            height: DeviceUtils.getScaledHeight(context, 0.018),
            width: DeviceUtils.getScaledWidth(context, 1),
            color: Colors.deepPurple,
          ),
          Container(
            height: DeviceUtils.getScaledHeight(context, 0.15),
            width: DeviceUtils.getScaledWidth(context, 1),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GoTech\nQuestionnaire",
                    style: TextStyle(
                      fontSize: DeviceUtils.getScaledFontSize(context, 26),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Show me what you got!')
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 2,
          ),
          Container(
            height: DeviceUtils.getScaledHeight(context, 0.05),
            width: DeviceUtils.getScaledWidth(context, 1),
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '* Required',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

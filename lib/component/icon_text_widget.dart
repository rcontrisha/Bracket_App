import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String iconAsset;
  final String text;

  const IconTextWidget(
      {super.key, required this.iconAsset, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconAsset),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

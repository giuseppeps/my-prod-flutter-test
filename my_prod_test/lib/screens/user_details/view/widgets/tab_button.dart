import 'package:flutter/material.dart';
import 'package:my_prod_test/core/theme/colors.dart';
import 'package:my_prod_test/core/theme/texts.dart';

class TabButton extends StatelessWidget {
  final String text;
  final int count;
  final bool selected;

  const TabButton({
    super.key,
    required this.text,
    required this.count,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: textStyle.copyWith(
            fontSize: 15,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: paleGrey,
          ),
          child: Center(
            child: Text(
              count.toString(),
              style: textStyle.copyWith(fontSize: 11),
            ),
          ),
        ),
      ],
    );
  }
}

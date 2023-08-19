import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prod_test/core/theme/colors.dart';
import 'package:my_prod_test/core/theme/texts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          SvgPicture.asset(
            'assets/images/github-logo-vector.svg', // Update with your SVG file path
            color: Colors.white,
            height: 120,
          ),
          const SizedBox(width: 8),
          Text(
            'profiles',
            style: textStyle2.copyWith(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

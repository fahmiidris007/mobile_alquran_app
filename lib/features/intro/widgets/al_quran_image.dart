import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlQuranImage extends StatelessWidget {
  const AlQuranImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFF672CBC)),
      child: SvgPicture.asset('assets/images/splash.svg'),
    );
  }
}

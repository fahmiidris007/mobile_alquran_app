
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrl extends StatelessWidget {
  final String url;
  final String icon;

  const LaunchUrl({
    super.key, required this.url, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await launchUrl(Uri.parse(url));
        },
        child: SvgPicture.asset(icon));
  }
}
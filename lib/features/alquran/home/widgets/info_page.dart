import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';
import 'package:url_launcher/url_launcher.dart';

import 'launch_url.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: buildinfo(),
    );
  }

  Center buildinfo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildText(
            text: 'Mobile App Developer :',
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          SizedBox(
            height: 8,
          ),
          BuildText(
            text: 'Fahmi Idris',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LaunchUrl(url: 'https://www.linkedin.com/in/fahmi-idris-87ba22259', icon: 'assets/images/linkedin.svg',),
              SizedBox(
                width: 20,
              ),
              LaunchUrl(url: 'https://github.com/fahmiidris007', icon: 'assets/images/github.svg',),
              SizedBox(
                width: 20,
              ),
              LaunchUrl(url: 'https://www.instagram.com/fahmiidris_007', icon: 'assets/images/instagram.svg',),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse('https://fahmiidris007.github.io/my_profile/'));
                },
                child: SvgPicture.asset(
                  'assets/images/website.svg',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          BuildText(
            text: 'UI Design :',
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          SizedBox(
            height: 8,
          ),
          BuildText(
            text: 'Tanvir Ahassan',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LaunchUrl(url: 'https://www.instagram.com/tanvir_ux', icon: 'assets/images/instagram.svg',),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse('https://tanvirux.contra.com/'));
                },
                child: SvgPicture.asset(
                  'assets/images/website.svg',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          BuildText(
            text: 'API Data Source :',
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          SizedBox(
            height: 8,
          ),
          BuildText(
            text: 'EQuran.id',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () async {
              await launchUrl(Uri.parse('https://equran.id/apidev/v2'));
            },
            child: SvgPicture.asset(
              'assets/images/website.svg',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}



// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'widgets/al_quran_image.dart';
import 'widgets/start_button.dart';
import 'widgets/build_text.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _buildBody(context),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  BuildText(
                    text: "AlQuran App",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BuildText(
                    text: "Let's Recite and Practice\nthe Holy AlQuran.",
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [AlQuranImage(), StartButton()],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

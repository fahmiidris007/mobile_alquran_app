import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';

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
    return const Center(
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
          BuildText(
            text: '(linkedin.com/in/fahmi-idris-87ba22259)',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          SizedBox(
            height: 24
          ),
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
          BuildText(
            text: '(www.instagram.com/tanvir_ux)',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          SizedBox(
              height: 24
          ),
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
          BuildText(
            text: '(https://equran.id/apidev/v2)',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
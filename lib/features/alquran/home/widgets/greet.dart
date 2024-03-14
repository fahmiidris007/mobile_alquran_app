import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';

import 'last_read.dart';

class Greet extends StatelessWidget {
  const Greet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildText(
            text: 'Assalamualaikum',
            fontSize: 18,
            color: AppColors.text,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 4,
          ),
          BuildText(
            text: 'Fahmi Idris',
            fontSize: 24,
            color: AppColors.text,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 24,
          ),
          LastRead()
        ],
      ),
    );
  }
}

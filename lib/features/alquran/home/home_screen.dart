import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';

import 'widgets/build_app_bar.dart';
import 'widgets/build_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildAppBar(),
      body: BuildBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';

import 'widgets/build_app_bar.dart';
import 'widgets/build_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: BuildAppBar(),
      body: BuildBody(),
    );
  }
}

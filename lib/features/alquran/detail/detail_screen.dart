import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/data/models/surah.dart';

import 'widgets/build_app_bar.dart';
import 'widgets/build_body.dart';

class DetailScreen extends StatelessWidget {
  final int noSurat;
  const DetailScreen({super.key, required this.noSurat});

  Future<Surah> _getDetailSurah() async {
    var data = await Dio().get("https://equran.id/api/surat/$noSurat");
    return Surah.fromJson(json.decode(data.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Surah>(
        future: _getDetailSurah(),
        initialData: null,
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              backgroundColor: AppColors.background,
            );
          }
          Surah surah = snapshot.data!;
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: BuildAppBar(surah: surah),
            body: BuildBody(surah: surah),
          );
        }));
  }
}

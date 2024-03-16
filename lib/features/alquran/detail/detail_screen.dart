import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/data/models/surah_detail.dart';
import 'package:mobile_alquran_app/features/alquran/detail/bloc/detail_surah_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/build_app_bar.dart';
import 'widgets/build_body.dart';

class DetailScreen extends StatefulWidget {
  final int noSurat;
  const DetailScreen({super.key, required this.noSurat});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  void initState() {
    super.initState();

    context.read<DetailSurahBloc>().add(FetchDetailSurah(widget.noSurat));
  }

  Future<void> _saveSurahDetailToPrefs(SurahDetail surahDetail) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastReadSurahLatin', surahDetail.namaLatin!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailSurahBloc, DetailSurahState>(
      builder: (context, state) {
        if (state is DetailSurahLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is DetailSurahError) {
          return Scaffold(
            body: Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else if (state is DetailSurahLoaded) {
          final SurahDetail surah = state.surahDetail;
          _saveSurahDetailToPrefs(surah);
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: BuildAppBar(surah: surah),
            body: BuildBody(surah: surah),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

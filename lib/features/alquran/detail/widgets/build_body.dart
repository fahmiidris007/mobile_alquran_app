import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/data/models/surah_detail.dart';

import 'ayat_item.dart';
import 'detail_topbar.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required this.surah,
  });

  final SurahDetail surah;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: DetailSurah(surah: surah),
        )
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.separated(
          itemBuilder: (context, index) => AyatItem(
            ayat: surah.ayat!.elementAt(index + (surah.nomor == 1 ? 1 : 0)),
          ),
          itemCount: surah.jumlahAyat! + (surah.nomor == 1 ? -1 : 0),
          separatorBuilder: (context, index) => Container(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/data/models/surah_bookmark.dart';
import 'package:mobile_alquran_app/data/models/surah_list.dart';
import 'package:mobile_alquran_app/features/alquran/detail/detail_screen.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';

class BookmarkItem extends StatelessWidget {
  const BookmarkItem({required this.context, required this.surah, super.key});

  final SurahBookmark surah;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(
                  noSurat: surah.nomor!,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/images/nomor-surah.svg'),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                    child: BuildText(
                      text: "${surah.nomor}",
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildText(
                  text: surah.namaLatin!,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    BuildText(
                      text: surah.tempatTurun!.name,
                      fontSize: 12,
                      color: AppColors.text,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.text),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    BuildText(
                      text: "${surah.jumlahAyat} Ayat",
                      fontSize: 12,
                      color: AppColors.text,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            )),
            BuildText(
              text: surah.nama!,
              fontSize: 20,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}

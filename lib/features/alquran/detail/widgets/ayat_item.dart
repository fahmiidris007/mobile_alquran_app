import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/data/models/surah_detail.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AyatItem extends StatelessWidget {
  const AyatItem({super.key, required this.ayat});

  final Ayat ayat;

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastReadSurah', ayat.surah!);
    await prefs.setInt('lastReadAyat', ayat.nomor!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.gray, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(27 / 2)),
                  child: Center(
                    child: BuildText(
                      text: '${ayat.nomor}',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    await _saveToPrefs();
                  },
                  child: Icon(
                    Icons.star_border_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          BuildText(
            text: ayat.ar!,
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
          BuildText(
            text: ayat.idn!,
            fontSize: 16,
            color: AppColors.text,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
